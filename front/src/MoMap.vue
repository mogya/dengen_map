<template>
  <div class="momap">
    <gmap-map
      :center="{lat: initial.lat, lng: initial.lng}"
      :zoom="initial.zoom"
      :options="options"
      @center_changed="onUpdateCenter"
      @zoom_changed="onUpdateZoom($event)"
      @bounds_changed="onUpdateBounds($event)"
      @drag="onDrag"
      @dragend="onEvent('dragend',$event)"
      @idle.once="onFirstIdle"
      @idle="onIdle"
      @resize="onEvent('resize',$event)"
      ref='gmapMap'
    >
      <gmap-marker
        :position="{ lat: initial.lat, lng: initial.lng }"
        :clickable="false"
        :draggable="false"
      ></gmap-marker>
      <gmap-marker
        v-for="spot in spots"
        :position="{ lat: spot.latitude, lng: spot.longitude }"
        :title="spot.name"
        :icon="spot.powerframeIcon"
        :clickable="true"
        :draggable="false"
        @click="onMarkerClick(spot)"
      >
        <gmap-info-window
          :opened="currentSpot && spot.id === currentSpot.id"
          @closeclick='onInfoWindowClosed(spot)'
        >
          <div class='gmap-info-window'>
            <p class='title'><a :href='spot.moUrl'>{{spot.title}}</a></p>
            <p class='address'>{{spot.address}}</p>
            <div>
              <mo-spot-icons :spot='spot' style="float:left;" ></mo-spot-icons>
              <span class="spot_more" style="float:right;">
              <a class="spot_name btn btn-primary" :href="spot.moUrl">詳細</a>
              </span>
            </div>
          </div>
        </gmap-info-window>
      </gmap-marker>
    </gmap-map>
    <div style='display:none;'>
      <div id='js-search-control' class='gmap-control'>
        <span @click="onSearchCancelControlClick" v-show="showSearchControl">
          <i class="icon-caret-right"></i>
        </span>
        <input type='text' placeholder='地名や駅名を入力'
           v-show="showSearchControl" @keyup.enter="search" v-model="searchWord">
        </input>
        <span @click="onSearchControlClick">
          <i class="icon-search" aria-hidden="true"></i>
        </span>
      </div>
      <div id='js-gps-control' class='gmap-control'>
        <span @click="onGpsControlClick">
          <i class="icon-location-arrow" aria-hidden="true"></i>
        </span>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.momap{
  .vue-map-container, .vue-map{
    bottom: 0;
    width: 100%;
    position: absolute;
    top: 0;
  }
  .gmap-control{
    background-color: #FFF;
    border: 2px solid #FFF;
    border-radius: 3px;
    box-shadow: 0 2px 6px rgba(0,0,0,.3);
    cursor: pointer;
    margin-bottom: 22px;
    text-align: center;
    span{
      color: rgb(25,25,25);
      font-size: 16px;
      line-height: 40px;
      padding-left: 15px;
      padding-right: 15px;
    }
  }
  .gmap-info-window{
    ul{
      margin: 0;
      padding: 0;
    }
    .title{
      color: #3A86AF;
      font-size: 1.2em;
      font-weight: bold;
      a{
        text-decoration: none;
      }
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    .address{
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      max-width: 20em;
    }
  }
  #js-search-control{
    input{
      max-width: 280px;
      font-size: 16px;
    }
    input:hover{
      background: #acf3ff;
    }
  }
}
</style>

<script>
import MoSpotIcons from './MoSpotIcons.vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import Vue from 'vue';
import errorNotification from './util/ErrorNotification';

Vue.use(VueGoogleMaps, {
  installComponents: true,
  load: {
    key: 'AIzaSyASFdKMliEfcxeS4ObTBrfolr7Ju5H93aQ',
  }
});

export default {
  name: 'MoMap',
  data(){
    return {
      lat: null,
      lng: null,
      zoom: null,
      bounds: { n:null, s:null, w:null, e:null },
      options:{
        mapTypeId: 'roadmap',
        mapTypeControl: false,
        panControl:false,
        streetViewControl:false
      },
      currentSpot: null,
      searchWord: '',
      showSearchControl: false,
      movingByInfoWindow: false
    }
  },
  props:{
    initial: {type:Object, required:false,
      default:()=>{
        return {
          lat: 35.68129,
          lng: 139.76624,
          zoom: 15
        }
      }
    },
    spots: {type:Array, required:false, default:[]}
  },
  methods: {
    onUpdateCenter(center){
      this.lat = center.lat();
      this.lng = center.lng();
    },
    onUpdateBounds(bounds){
      const swne = bounds.toUrlValue().split(',');
      this.bounds.s = swne[0];
      this.bounds.w = swne[1];
      this.bounds.n = swne[2];
      this.bounds.e = swne[3];
    },
    onDrag(){
      // InfoWindowを開いたままドラッグすると、InfoWindowの位置に引き戻されて微妙な操作感になるので、ドラッグしたら閉じる
      this.currentSpot = null;
    },
    onUpdateZoom(zoom){
      this.zoom = zoom;
      this.$emit('zoom_changed',zoom);
    },
    onMarkerClick(spot){
      ga('send', 'event', 'map', 'MarkerClick');
      this.movingByInfoWindow = true;
      this.currentSpot = spot;
      this.$emit('current-spot-changed',spot);
    },
    onInfoWindowClosed(spot){
      this.currentSpot = null;
      this.$emit('current-spot-changed',null);
    },
    onFirstIdle(){
      if (!this.gmapObj){
        this.gmapObj = this.$refs.gmapMap.$mapObject;
        this.onUpdateCenter(this.gmapObj.getCenter())
        this.onUpdateZoom(this.gmapObj.getZoom());
        this.onUpdateBounds(this.gmapObj.getBounds());
        this.addMapControls();
      }
    },
    onIdle(){
      if (this.movingByInfoWindow){
        // InfoWindowを開くと、GoogleMapsがInfoWindowを見やすい位置に地図をスクロールさせる
        // これに合わせてデータをリロードすると、InfoWindowの再描画が走ってとても見づらいので、一回イベントをスキップする
        this.movingByInfoWindow = false;
      }else{
        this.$emit('idle');
      }
    },
    inCurrentBounds(spot){
      return this.gmapObj.getBounds().contains(new google.maps.LatLng({lat: spot.latitude, lng: spot.longitude}));
    },
    onEvent(eventName, event){
      this.$emit(eventName, event);
    },
    onGpsControlClick(){
      ga('send', 'event', 'map', 'GpsControlClick');
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position)=>{
          this.gmapObj.setCenter({lat: position.coords.latitude, lng: position.coords.longitude});
        });
      }
    },
    onSearchControlClick(){
      ga('send', 'event', 'map', 'SearchControlClick');
      if(this.showSearchControl){
        this.search();
      }else{
        this.showSearchControl = true;
      }
    },
    onSearchCancelControlClick(){
      ga('send', 'event', 'map', 'SearchCancelControlClick');
      this.showSearchControl = false;
    },
    search(){
      if(!this.geocoder){
        this.geocoder = new google.maps.Geocoder();
      }
      if (this.searchWord.length>0){
        ga('send', 'event', 'map', 'Search');
        ga('set', 'dimension1', this.searchWord);
        this.geocoder.geocode( { 'address': this.searchWord}, (results, status)=>{
          if (status == google.maps.GeocoderStatus.OK) {
            this.gmapObj.setCenter(results[0].geometry.location);
            this.$emit('searched', this.searchWord);
          } else {
            this.$emit('error','Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    },
    addMapControls(){
      const searchControlDiv = document.getElementById('js-search-control');
      searchControlDiv.index = 2;
      this.gmapObj.controls[google.maps.ControlPosition.TOP_RIGHT].push(searchControlDiv);

      const gpsControlDiv = document.getElementById('js-gps-control');
      gpsControlDiv.index = 1;
      this.gmapObj.controls[google.maps.ControlPosition.TOP_RIGHT].push(gpsControlDiv);
    }
  },
  components:{
    MoSpotIcons
  }
};
</script>

