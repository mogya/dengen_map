<template>
<div >
  <div class="area__main" >
    <div class='area__tags clearfix'>
      <h1>Categories</h1>
      <div v-for="(tag,i) in category_tags" key='tag.id' class='area__tag'>
        <p class='name'><small>({{tag.id}})</small>{{tag.name}}</p>
        <ul class="spot__icons">
          <li class='spot_icon'
            :style='`background-image: url(${tag.image});background-position: 0 0;`'
            :title='image'
          />
          <li class='spot_icon'
            :style='`background-image: url(${tag.sprite_url});background-position: -${tag.sprite_x}px 0;`'
            :title='sprite'
          />
        </ul>
        <table class="clearfix">
            <tr><th>id</th><td>{{tag.id}}</td></tr>
            <tr>name</th><td>{{tag.name}}</td></tr>
            <tr>type</th><td>{{tag.type}}</td></tr>
            <tr>image</th><td>{{tag.image}}</td></tr>
            <tr>sprite_pos</th><td>{{tag.sprite_pos}}</td></tr>
            <tr>detail</th><td>{{tag.detail}}</td></tr>
            <tr>importance</th><td>{{tag.importance}}</td></tr>
            <tr>parent_id</th><td>{{tag.parent_id}}</td></tr>
            <tr>image_id</th><td>{{tag.image_id}}</td></tr>
        </table>
      </div>
    </div>
    <div class='area__tags clearfix'>
      <h1>Wifi</h1>
      <div v-for="(tag,i) in wifi_tags" key='tag.id' class='area__tag'>
        <p class='name'><small>({{tag.id}})</small>{{tag.name}}</p>
        <ul class="spot__icons">
          <li class='spot_icon'
            :style='`background-image: url(${tag.image});background-position: 0 0;`'
            :title='image'
          />
          <li class='spot_icon'
            :style='`background-image: url(${tag.sprite_url});background-position: -${tag.sprite_x}px 0;`'
            :title='sprite'
          />
        </ul>
        <table class="clearfix">
            <tr><th>id</th><td>{{tag.id}}</td></tr>
            <tr>name</th><td>{{tag.name}}</td></tr>
            <tr>type</th><td>{{tag.type}}</td></tr>
            <tr>image</th><td>{{tag.image}}</td></tr>
            <tr>sprite_pos</th><td>{{tag.sprite_pos}}</td></tr>
            <tr>detail</th><td>{{tag.detail}}</td></tr>
            <tr>importance</th><td>{{tag.importance}}</td></tr>
            <tr>parent_id</th><td>{{tag.parent_id}}</td></tr>
            <tr>image_id</th><td>{{tag.image_id}}</td></tr>
        </table>
      </div>
    </div>
    <div class='area__tags clearfix'>
      <h1>Others</h1>
      <div v-for="(tag,i) in other_tags" key='tag.id' class='area__tag'>
        <p class='name'><small>({{tag.id}})</small>{{tag.name}}</p>
        <ul class="spot__icons">
          <li class='spot_icon'
            :style='`background-image: url(${tag.image});background-position: 0 0;`'
            :title='image'
          />
          <li class='spot_icon'
            :style='`background-image: url(${tag.sprite_url});background-position: -${tag.sprite_x}px 0;`'
            :title='sprite'
          />
        </ul>
        <table class="clearfix">
            <tr><th>id</th><td>{{tag.id}}</td></tr>
            <tr>name</th><td>{{tag.name}}</td></tr>
            <tr>type</th><td>{{tag.type}}</td></tr>
            <tr>image</th><td>{{tag.image}}</td></tr>
            <tr>sprite_pos</th><td>{{tag.sprite_pos}}</td></tr>
            <tr>detail</th><td>{{tag.detail}}</td></tr>
            <tr>importance</th><td>{{tag.importance}}</td></tr>
            <tr>parent_id</th><td>{{tag.parent_id}}</td></tr>
            <tr>image_id</th><td>{{tag.image_id}}</td></tr>
        </table>
      </div>
    </div>
  </div>
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
  .spot_icon{
    width: 45px;
    height: 45px;
    text-align: center;
    float: left;
    list-style: none;
    border: 1px #D0D0D0 solid;
  }
  .area__tag{
    border: 1px #E0E0E0 dotted;
    float:left;
    width: 25%;
    table{
      font-size: 6pt;
    }
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
</style>
<script>
import Vue from 'vue';
import MoApiV1 from './api/MoApiV1';
import MoTag from './MoTag';
import errorNotification from './util/ErrorNotification';

const moAPI = new MoApiV1();

export default {
  name: 'App',
  data(){
    return {
      category_tags:[],
      wifi_tags:[],
      other_tags:[],
      icon_size: 45
    }
  },
  created(){
    this.smpMode = (screen.height<800);
    this.update();
  },
  methods: {
    update(){
      let params = {}
      moAPI.tags(params).then(
        (result) => {
          try{
            console.log(`moAPI return.`);
            if (result.status === 200){
              console.log('moapi success')
              console.log(result.data)
              for (let tag of result.data.categories){
                this.category_tags.push(new MoTag(tag, this.icon_size))
              }
              for (let tag of result.data.wifi){
                this.wifi_tags.push(new MoTag(tag, this.icon_size))
              }
              for (let tag of result.data.others){
                this.other_tags.push(new MoTag(tag, this.icon_size))
              }
            }else{
              errorNotification(result);
              errorNotification(result.message);
              errorNotification(result.data.message);
            }
          }
          catch(e){
            errorNotification(e);
          }
        },
        (err)=>{
          errorNotification(err);
          errorNotification(err.message);
        }
      );
    },
  }
};
</script>
