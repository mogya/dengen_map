<template>
  <div class="didyoumean well section collapse in" aria-expanded="true" v-if='!closed && candidates.length>0'>
    <h5 class="title">もしかして...
      <i class="icon-close" aria-hidden="true" @click='closed=true'></i></h5>
    <div>
      <span v-for="station in candidates">
        <a :href="stationUrl(station)">{{station.name}}({{station.line}})</a>
      </span>
    </div>
  </div>
</template>

<style lang="scss">
.didyoumean{
  position: fixed;
  width: 100%;
  border: 1px solid #111;
  border-radius: 10px;
  z-index: 10;
  .title{
    .fa{
      float: right;
      cursor: pointer;
      font-size: x-large;
    }
  }
  span{
    font-size: 1.2em;
    &:after{
      content: ' / '
    }
    &:last-child:after{
      content: ''
    }
  }
}
</style>

<script>
import MoApi from './api/MoApi';
const moAPI = new MoApi();

export default {
  name: 'DidYouMean',
  props:{
    query: {type:String, required:true, default:'' }
  },
  data(){
    return {
      closed: false,
      candidates: [],
      color: '#FFF'
    }
  },
  created(){
  },
  methods: {
    onUpdateCenter(center){
      this.lat = center.lat();
      this.lng = center.lng();
    },
    stationUrl(station){
      const title = encodeURIComponent(`${station.name}(${station.line})`);
      return `/map/${title}?ll=${station.latitude},${station.longitude}&z=15`;
    }
  },
  watch:{
    query(val){
      if (val && val.length>0){
        const params = {
          name: val.replace(/駅$/,''),
          strict: true
        };
        moAPI.station(params)
          .then( (response)=>{
            if (response.data.results.length>1){
              response.data.results.forEach((candidate)=>{
                this.candidates.push(candidate);
              });
            }
          })
          .catch( (error)=>{
            this.$emit('error',error);
          });
      }
    }
  }
};
</script>


