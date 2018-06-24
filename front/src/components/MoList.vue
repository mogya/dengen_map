<template>
  <div class='molist spot__area clearfix'>
    <div v-for="(spot,i) in sortedSpots" key='spot.id' :class="`area-${i}`">
      <div class='col-xs-12 col-sm-6 col-md-4 spot__area_outer'>
        <div class='spot__area_inner' :class="{selected: isSpotSelected(spot)}" >
          <p class='title'><a :href='spot.moUrl'>{{spot.title}}</a></p>
          <mo-spot-icons :spot='spot'></mo-spot-icons>
          <p class='address'>{{spot.address}}</p>
        </div>
      </div>
      <div class='col-xs-12 ad_area_inlist' v-if="showAd(i)">
        <moadvertisement adType='inlist' ></moadvertisement>
      </div>
    </div>
    <div class='col-xs-12 ad_area_inlist'>
      <moadvertisement adType='inlist' ></moadvertisement>
    </div>
  </div>
</template>

<style lang="scss">
.molist{
  ul{
    margin: 0;
    padding: 0;
  }
  .spot__area{
    padding-top: 5px;
    padding-right: 10px;
    &_outer{
      float:left;
      padding: 0 3px;
    }
    &_inner{
      border: 1px solid #111;
      border-radius: 10px;
      height: 100px;
      margin-left: 0px;
      margin-bottom: 5px;
      padding: 10px;
      transition-property: border, background;
      transition-duration: .5s;
      transition-timing-function: ease-in;
      .title{
        color: #3A86AF;
        font-size: 1.2em;
        font-weight: bold;
        margin: 0;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        a{
          text-decoration: none;
        }
      }
      .address{
        margin: 0;
        overflow: hidden;
        text-align: right;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
    }
    .selected{
      background-color: #CCF;
    }
  }
}
</style>

<script>
import Responsible from '@/util/Responsible.js';
import MoSpotIcons from '@/components/MoSpotIcons.vue';
import MoAdvertisement from '@/components/MoAdvertisement.vue';
const responsible = new Responsible;

export default {
  name: 'MoList',
  computed: {
    sortedSpots(){
      return this.spots.sort( (spot_a,spot_b)=>{
        return spot_a.distance - spot_b.distance;
      });
    }
  },
  components:{
    MoSpotIcons,
    moadvertisement: MoAdvertisement,
  },
  props:{
    spots: {type:Array, required:false, default:()=>[] },
  },
  data(){
    return {
      currentSpot: null
    }
  },
  methods: {
    isSpotSelected(spot){
      return this.currentSpot && spot.id === this.currentSpot.id
    },
    setCurrentSpot(spot){
      this.currentSpot = spot;
    },
    showAd(index){
      if (index===0){
        return false;
      }
      if (responsible.sm){
        return (index%12===2);
      }else if (responsible.md){
        return (index%12===3);
      }
      return false;
    }
  }
};
</script>

