<template>
  <div>
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
import IconSprite from './util/IconSprite.js';

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
        if(tag==="電源OK"){
          icon.pos = IconSprite.POWER_OK;
          icon.text = "電源:OK";
        }else if(tag==='電源NG'){
          icon.pos = IconSprite.POWER_NG;
          icon.text = "電源:NG";
        }else if(tag==='電源:実績あり'){
          icon.pos = IconSprite.POWER_OK2;
          icon.text = "使えた<br />実績あり";
        }else if (tag==='電源あり(喫煙席)'){
          icon.pos = IconSprite.POWER_SMOKE;
          icon.text = "電源あり<br />(喫煙席)";
        }else if (tag==='電源あり(禁煙席)'){
          icon.pos = IconSprite.POWER_NOSOMKE;
          icon.text = "電源あり<br />(禁煙席)";
        }else if(tag==='置くだけ充電'){
          icon.pos = IconSprite.QI;
          icon.text = "ワイヤレス<br />充電";
        }else if(tag==='Qi'){
          icon.pos = IconSprite.QI;
          icon.text = "ワイヤレス<br />充電";
        }else if (tag==='タバコ:全席禁煙'){
          icon.pos = IconSprite.NOSMOKE;
          icon.text = "全席禁煙";
        }else if (tag==='タバコ:全席喫煙可'){
          icon.pos = IconSprite.SMOKE;
          icon.text = "全席喫煙可";
        }else if (tag==='タバコ:分煙'){
          icon.pos = IconSprite.SMOKE_SEPARATE;
          icon.text = "分煙";
        }else if (tag==='イートインスペース'){
          icon.pos = IconSprite.EATINSPACE;
          icon.text = "イートイン<br />スペース";
        }else{
          return;
        };
        icon.title = icon.text.replace(/<[^>]*>/,'');
        icon.size = 30;
        icon.cssPos = -1*icon.size*icon.pos;
        ret.push(icon);
      });
      this.spot.wirelesses.forEach((wireless)=>{
        let icon={};
        if(wireless==='ソフトバンクWi-Fi'){
          icon.pos = IconSprite.WIFI_SOFTBANK;
          icon.text = "Softbank<br />Wi-Fi";
        }else if(wireless==='docomo Wi-Fi'){
          icon.pos = IconSprite.WIFI_DOCOMO;
          icon.text = "ドコモ<br />Wi-Fi";
        }else if(wireless==='au Wi-Fi'){
          icon.pos = IconSprite.WIFI_AU;
          icon.text = "au-wifi";
        }else if (wireless==='livedoor Wireless'){
          return;// do nothing. just skip.
        }else if(wireless==='BBモバイルポイント'){
          icon.pos = IconSprite.WIFI_BBMOBILE;
          icon.text = "BBモバイル<br />ポイント";
        }else if (wireless==='ホットスポット'){
          icon.pos = IconSprite.WIFI_HOTSPOT;
          icon.text = "HOTSPOT";
        }else if (wireless==='フレッツ・スポット'){
          icon.pos = IconSprite.WIFI_FLETS;
          icon.text = "フレッツ<br />スポット";
        }else if (wireless==='FREESPOT'){
          icon.pos = IconSprite.WIFI_FREESPOT;
          icon.text = "FREESPOT";
        }else if (wireless==='有線LAN'){
          icon.pos = IconSprite.WIFI_CABLE;
          icon.text = "有線LAN";
        }else if (wireless==='STARBUCKS Wi-Fi'){
          icon.pos = IconSprite.WIFI_STARBUCKS;
          icon.text = "スターバックス<br />Wi-Fi";
        }else if (wireless==='ファミマWi-Fi'){
          icon.pos = IconSprite.WIFI_FAMILYMART;
          icon.text = "ファミマ<br />Wi-Fi";
        }else if (wireless==='Lawson Wi-Fi'){
          icon.pos = IconSprite.WIFI_LAWSON;
          icon.text = "ローソン<br />Wi-Fi";
        }else if (wireless==='7SPOT'){
          icon.pos = IconSprite.WIFI_SEVENELEVEN;
          icon.text = "セブンスポット";
        }else if (wireless==='独自'){
          icon.pos = IconSprite.WIFI_OTHER;
          icon.text = "独自";
        }else if (wireless==='wi2'){
          icon.pos = IconSprite.WIFI_WI2;
          icon.text = "wi2";
        }else if (wireless==='Tullys Wi-Fi'){
          icon.pos = IconSprite.WIFI_TULLYS;
          icon.text = "Tullys<br />Wi-Fi";
        }else if (wireless.length>0){
          icon.pos = IconSprite.WIFI_OTHER;
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

