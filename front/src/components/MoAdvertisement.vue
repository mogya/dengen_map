<template>
  <div class='moadvertisement'>
    <div class='header' v-if="adType==='header'">
      <!-- レスポンシブ1 -->
      <ins class="adsbygoogle"
           style="display:block;height:100px;"
           data-ad-client="ca-pub-8938282722970170"
           data-ad-slot="8798193478"
           data-ad-format="horizontal"></ins>
    </div>
    <div class='header' v-if="adType==='footer'">
      <!-- レスポンシブ1 -->
      <ins class="adsbygoogle"
           style="display:block;height:100px;"
           data-ad-client="ca-pub-8938282722970170"
           data-ad-slot="8798193478"
           data-ad-format="horizontal"></ins>
    </div>
    <div class='header' v-if="adType==='inlist'">
      <!-- レスポンシブ1 -->
      <ins class="adsbygoogle"
           style="display:block;height:100px;"
           data-ad-client="ca-pub-8938282722970170"
           data-ad-slot="8798193478"
           data-ad-format="horizontal"></ins>
    </div>
    <div class='smp_header' v-if="adType==='responsible'">
      <!-- レスポンシブ1 -->
      <ins class="adsbygoogle"
           style="display:block"
           data-ad-client="ca-pub-8938282722970170"
           data-ad-slot="8798193478"
           data-ad-format="auto"></ins>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MoAdvertisement',
  props:{
    adType: {type:String, required:true}
  },
  data(){
    return {
      smpMode: false
    }
  },
  created(){
    this.smpMode = (screen.width<728);
  },
  mounted(){
    this.$nextTick(()=>{
      (window.adsbygoogle = window.adsbygoogle || []).push({})
    });
  },
  computed: {
    headerMode(){
      if (this.adType==='header'){
        if (this.smpMode){
          return 'smp_header';
        }else{
          return 'pc_header';
        }
      }
      return 'other';
    }
  },
};
</script>

