<template>
<div :class="{ pc:!smpMode, smp:smpMode }" >
<h1>contribute</h1>
</div>
</template>
<style lang="scss">
$z-map: (
  default_layer,
  ad_layer,
  menu_layer,
  loading_layer,
  message_layer,
  grayout_layer
);
@function z($name) {
  @return index($z-map, $name);
}

html, body, #wrapper, #wrapper>div {
  height: 100%;
  width: 100%;
  margin: 0px;
  padding: 0px;
  position: relative;
}
.area__ad_header,.area__ad_footer{
  height: 100px;
  width: 100%;
  z-index: z(ad_layer);
}
.area__ad_footer{
  position: absolute;
  bottom: 0;
}
.pc{
  .area__main{
    position: absolute;
    left: 0;
    top: 100px;
    width: 100%;
  }
}
.smp{
  .area__main{
    bottom: 100px;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
  }
}

.momenu{
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  z-index: z(menu_layer);
}
.momap{
}
.pc{
  .momap{
    height: 400px;
    left: 0;
    position: absolute;
    top: 75px;
    z-index: z(default_layer);
    width: 100%;
  }
}
.smp{
  .momap{
    bottom: 0;
    left: 0;
    position: absolute;
    top: 75px;
    width: 100%;
    z-index: z(default_layer);
  }
}
.momap_loading, .momap_message{
  left: 0;
  position: absolute;
  text-align: center;
  top: 300px;
  width: 100%;
  z-index: z(loading_layer);
}
.momap_message{
  z-index: z(message_layer);
}
.momap_loading img, .momap_message p{
  background: white;
  border: 1px solid black;
  border-radius: 10px;
  padding: 10px;
}
.molist{
  bottom: 0;
  position: absolute;
  top: 480px;
  width: 100%;
}
</style>
<script>
import Vue from 'vue';
import MoAdvertisement from './MoAdvertisement.vue';
import MoMap from './MoMap.vue';
import MoMenu from './MoMenu.vue';
import MoList from './MoList.vue';
import MoSpot from './MoSpot.js';
import MoUrlParams from './MoUrlParams.js';
import MoStorage from './MoStorage.js';
import MoApi from './api/MoApi';
import DidYouMean from './DidYouMean.vue';
import errorNotification from './util/ErrorNotification';

const moAPI = new MoApi();
const urlParams = new MoUrlParams();
const storage = new MoStorage();

// https://github.com/xkjyeah/vue-google-maps
import * as VueGoogleMaps from 'vue2-google-maps';
Vue.use(VueGoogleMaps, {
  installComponents: true,
  load: {
    key: 'AIzaSyASFdKMliEfcxeS4ObTBrfolr7Ju5H93aQ',
    v: '3.26',
    libraries: 'places'
  }
});

// // https://github.com/MatteoGabriele/vue-analytics
// import VueAnalytics from 'vue-analytics'
// Vue.use(VueAnalytics, {
//   id: 'UA-2495522-5',
//   debug: {
//     enabled: true,
//     trace: false,
//     sendHitTask: true
//   }
// });

export default {
  name: 'Contribute',
  data(){
    return {
      spots:[],
      loading: false,
      message: null,
      smpMode: false,
      searchWord: ''
    }
  },
  components: {
    moadvertisement: MoAdvertisement,
    momap: MoMap,
    momenu: MoMenu,
    molist: MoList,
    didyoumean: DidYouMean
  },
  created(){
    this.smpMode = (screen.height<800);
    this.searchWord = urlParams.getTitle()||'';
  },
  methods: {
    onFirstIdle(){
      if (!this.momap){
        this.momap = this.$refs.momap;
        this.momenu = this.$refs.momenu;
        this.molist = this.$refs.molist;
      }
      this.adjustMapSize();
      this.update();
    },
    onResize(){
      this.update();
    },
    onIdle(){
      if (this.momap){
        this.update();
      };
    },
    onDragend(event){
      ga('send', 'event', 'map', 'DragEnd');
      urlParams.setTitle(null);
      this.searchWord = '';
    },
    onUpdateZoom(zoom){
      if (this.momap){
        ga('send', 'event', 'map', 'UpdateZoom');
        this.update();
      }
    },
    onSearched(keyword){
      this.searchWord = keyword||'';
      urlParams.setTitle(keyword);
    },
    onError(message){
      errorNotification(message);
    },
    onErrorTooMuchSpots(){
      ga('send', 'event', 'map', 'ErrorTooMuchSpots');
      this.message = 'スポット数が多すぎて表示できません。地図を拡大するとスポットが表示されます。';
    },
    onCurrentSpotChanged(spot){
      ga('send', 'event', 'map', 'CurrentSpotChanged');
      this.molist.setCurrentSpot(spot);
    },
    onMenuChanged(){
      ga('send', 'event', 'map', 'MenuChanged');
      this.update();
    },
    onMenuOpened(open){
      ga('send', 'event', 'map', 'MenuOpened');
      // this.adjustMapSize();
    },
    adjustMapSize(){
      // if (this.smpMode){
      //   const gmapDiv = document.getElementsByClassName('vue-map')[0];
      //   const momenuHeight = document.getElementsByClassName('momenu')[0].offsetHeight + 10;
      //   // const adHeaderHeight = document.getElementsByClassName('area__ad_header')[0].offsetHeight;
      //   const adFooterHeight = document.getElementsByClassName('area__ad_footer')[0].offsetHeight;
      //   gmapDiv.style.height = `${window.innerHeight-momenuHeight-adFooterHeight}px`;
      //   if (google && google.maps){
      //     google.maps.event.trigger(this.momap.gmapObj,'resize');
      //   }
      // }
    },
    update(){
      this.loading = true;
      this.message = null;
      let tasks = [];
      ['電源OK','電源:実績あり'].forEach((power_tag)=>{
        const params = {
          tag: power_tag,
          n: this.momap.bounds.n,
          s: this.momap.bounds.s,
          w: this.momap.bounds.w,
          e: this.momap.bounds.e,
          lat: this.momap.lat,
          lng: this.momap.lng
        }
        tasks.push( moAPI.search(params) );
      });
      Promise.all(tasks).then(
        ([result1,result2]) => {
          this.message = null;
          this.spots.splice(0, this.spots.length);
          this.addSpots(result1.data);
          this.addSpots(result2.data);
          this.storeSettings();
          this.loading = false;
        },
        (err)=>{
          errorNotification(err);
          errorNotification(err.message);
          if (err.response) {
            errorNotification(err.response.data.message);
            this.onErrorTooMuchSpots();
          };
          this.loading = false;
        }
      );
    },
    storeSettings(){
      urlParams.setLatLng( this.momap.lat, this.momap.lng );
      urlParams.set('z',this.momap.zoom);
      if (this.momenu.pcMode){
        storage.set('type','pc');
      }else{
        storage.set('type','mobile');
      }
      if (this.momenu.showNetCafe){
        storage.set('netcafe','true');
      }else{
        storage.set('netcafe','false');
      }
    },
    addSpots(data){
      data.results.forEach((spot)=>{
        if (this.spotFilter(spot)){
          this.spots.push(new MoSpot(spot));
        }else{
          // console.log(`skiped: (${spot.id})${spot.title}`);
        }
      });
    },
    spotFilter(spot){
      // console.log(`${spot.id}:${spot.title}`);
      // console.log(`showNetCafe:${this.momenu.showNetCafe}`);
      // console.log(`NetCafe:${spot.tags.indexOf('ネットカフェ')}`);
      if (this.momenu.pcMode){
        if (0 > spot.tags.indexOf('用途:ノマド') ){
          return false;
        }
        if (!this.momenu.showNetCafe && (0 <= spot.tags.indexOf('ネットカフェ')) ){
          return false;
        }
      }
      if (!this.momenu.pcMode && (0 > spot.tags.indexOf('用途:充電')) ){
        return false;
      }
      return true;
    },
    initialMapData(){
      return {
        lat: urlParams.getLat()||35.68129,
        lng: urlParams.getLng()||139.76624,
        zoom: urlParams.getInt('z')||15
      }
    },
    initialMenuData(){
      return {
        pcMode: ( storage.get('type')==='pc' ),
        showNetCafe: ( storage.get('netcafe')==='true' ),
      }
    }
  }
};
</script>
