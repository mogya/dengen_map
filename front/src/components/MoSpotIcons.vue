<template>
  <div class="mo_spot_icons">
    <ul class="spot__icons">
      <li
        class='spot_icon'
        :style='`background-image: url(${spot.categoryIcon});`'
        :title='spot.categoryName'
      >
      <li v-for="icon in icons"
        class='spot_icon'
        :style='`background-image: url(//oasis.mogya.com/images/design/info_icon_sprite_${icon.size}px.png);background-position: ${icon.cssPos}px 0;`'
        :title='icon.title'
      >
        <!-- <p class='spot_icon_text'>{{icon.text}}</p> -->
      </li>
    </ul>
  </div>
</template>

<style>
.mo_spot_icons{
  height: 40px;
}
.spot__icons{
  height: 30px;
  overflow: hidden;
  margin-bottom: 10px;
}
.spot_icon{
  width: 30px;
  height: 30px;
  text-align: center;
  float: left;
  list-style: none;
}
</style>

<script>
import IconData from '@/util/IconData.js';

export default {
  name: 'MoSpotIcons',
  props:{
    spot: {type:Object, required:true},
  },
  computed: {
    icons(){
      let ret=[];
      this.spot.tags.forEach((tag)=>{
        let icon={};
        if (IconData[tag.name]){
          icon.pos = IconData[tag.name]['pos'];
          icon.text = IconData[tag.name]['text'];
        }else{
          return;
        };
        icon.title = icon.text.replace(/<[^>]*>/,'');
        icon.size = 30;
        icon.cssPos = -1*icon.size*icon.pos;
        // 古い電源タグと新しい電源タグが混在している場合の経過措置
        if (tag.name === '電源:お客様用コンセント' || tag.name === '電源:壁コンセント' || tag.name === '電源:USB'){
          ret = ret.filter((icon)=>{
            return (icon.title!='電源:OK' && icon.title!='使えた<br />実績あり' )
          });
        }

        ret.push(icon);
      });
      this.spot.wireless.forEach((wireless)=>{
        let icon={};
        if (IconData[wireless.name]){
          icon.pos = IconData[wireless.name]['pos'];
          icon.text = IconData[wireless.name]['text'];
        }else if (wireless.length>0){
          icon.pos = IconData["Other Wi-Fi"]['pos'];
          icon.text = wireless;
        }else{
          return;
        };
        icon.title = icon.text.replace(/<[^>]*>/,'');
        icon.size = 30;
        icon.cssPos = -1*icon.size*icon.pos;
        ret.push(icon);
      });
      return ret;
    }
  }
};
</script>

