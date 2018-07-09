<template>
<div :class="{ pc:!smpMode, smp:smpMode }" >
  <moadvertisement adType='header' class='area__ad_header' v-if='!smpMode'></moadvertisement>
  <div class='area__main'>
    <didyoumean
      :query='this.searchWord'
      @error="onError"
    ></didyoumean>
    <momenu
      ref='momenu'
      :initial="initialMenuData()"
      @changed="onMenuChanged"
      @menuOpened="onMenuOpened"
    >
    </momenu>
    <momap
      :initial="initialMapData()"
      :spots="spots"
      :showCenterPin="showCenterPin()"
      :contribute="false"
      ref='momap'
      @idle.once="onFirstIdle"
      @idle="onIdle"
      @dragend="onDragend"
      @resize="onResize"
      @zoom_changed="onUpdateZoom"
      @searched="onSearched"
      @error="onError"
      @current-spot-changed="onCurrentSpotChanged"
    >
    </momap>
    <div class='momap_loading' v-show="loading && message===null">
      <img src="https://oasis.mogya.com/images/design/loadingBar.gif" />
    </div>
    <div class='momap_message' v-show="message!==null">
      <p>{{message}}</p>
    </div>
    <molist ref='molist' :spots="spots" v-if='!smpMode'></molist>
  </div>
  <moadvertisement adType='footer' class='area__ad_footer' v-if='smpMode'></moadvertisement>
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
import MoAdvertisement from '@/components/MoAdvertisement.vue';
import MoMap from '@/components/MoMap.vue';
import MoMenu from '@/components/MoMenu.vue';
import MoList from '@/components/MoList.vue';
import MoSpot from '@/components/MoSpot.js';
import MoUrlParams from '@/components/MoUrlParams.js';
import MoStorage from '@/components/MoStorage.js';
import MoApi from '@/api/MoApi';
import MoApiV1 from '@/api/MoApiV1';
import DidYouMean from '@/components/DidYouMean.vue';
import errorNotification from '@/util/ErrorNotification';

const moAPI = new MoApiV1();
const urlParams = new MoUrlParams();
const storage = new MoStorage();
const max_spots = 200;

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
  name: 'App',
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
    },
    update(){
      this.loading = true;
      this.message = null;
      let tasks = [];
      let params = {
        tags: '電源:お客様用コンセント,電源:壁コンセント,電源:USB',
        n: this.momap.bounds.n,
        s: this.momap.bounds.s,
        w: this.momap.bounds.w,
        e: this.momap.bounds.e,
        max_spots: max_spots
      }
      if (!this.smpMode){
        params.lat = this.momap.lat;
        params.lng = this.momap.lng;
      }
      moAPI.spots(params).then(
        (result) => {
          try{
            if (result.data.status === 400){
              // console.log(result.data)
            }else if (result.data.status == 'TOO_MUCH_SPOTS'){
              this.onErrorTooMuchSpots()
            }else if (result.data.status !== 'OK'){
              errorNotification(result);
              errorNotification(result.message);
              errorNotification(result.data.message);
            }else{
              // console.log(`moAPI results.length:${result.data.results.length}`);
              this.message = null;
              this.spots.splice(0, this.spots.length);
              this.addSpots(result.data.results);
              this.storeSettings();
            }
          }
          finally{
            this.loading = false;
          }
        },
        (err)=>{
          errorNotification(err);
          errorNotification(err.message);
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
    addSpots(spots){
      spots.forEach((spot)=>{
        if (this.spotFilter(spot)){
          let v = this.spots.findIndex( (s)=>{
            return (s.id === spot.id)
          } );
          if (v < 0){
            // console.log(`adding ${spot.id}:${spot.title}`);
            this.spots.push(new MoSpot(spot));
          }else{
            // console.log(`skip ${spot.id}:${spot.title}`);
          }
        }
      },this);
    },
    spotFilter(spot){
      var for_pc = false;
      var for_mobile = false;
      var netcafe = false;
      spot.tags.forEach((tag)=>{
        switch (tag.name){
          case '用途:ノマド':
            for_pc = true;
            break;
          case '用途:充電':
            for_mobile = true;
            break;
          case 'ネットカフェ':
            netcafe = true;
            break;
        }
      })
      if (this.momenu.pcMode){
        if (!for_pc){
          return false;
        }
        if (!this.momenu.showNetCafe && netcafe){
          return false;
        }
      }
      if (!this.momenu.pcMode && (!for_mobile) ){
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
    },
    showCenterPin(){
      return (urlParams.getTitle().length>0)
    }
  }
};
</script>
