<template>
  <div class='momenu '>
    <div class='momenu__default clearfix'>
      <div class='momenu__button'>
        <a class="btn btn-default" :class="{ active:!pcMode }" href="#" @click="onClickPcMode(false)">
          <i class="icon-mobile" aria-hidden="true"></i>
          <span>充電</span>
        </a>
      </div>
      <div class='momenu__button'>
        <a class="btn btn-default" :class="{ active:pcMode }" href="#" @click='onClickPcMode(true)'>
          <i class="icon-laptop" aria-hidden="true"></i>
          <span>パソコン</span>
        </a>
      </div>
      <div class='momenu__button momenu__button--small'>
        <a class="btn btn-default" href="#" role="button" v-show='!showMore' @click='onClickMore'>
          <i class="icon-comment" aria-hidden="true"></i>
          <span >フィードバック</span>
        </a>
        <a class="btn btn-default" href="#" role="button" v-show='showMore' @click='onClickMore'>
          <i class="icon-caret-up" aria-hidden="true"></i>
          <span>戻る</span>
        </a>
      </div>
    </div>
    <div class='momenu__explain' v-show='!showMore'>
      <div v-if="pcMode">
        <span><i class="icon-laptop" aria-hidden="true"></i>パソコン作業に適したお店を表示しています</span>
        <span>
          ( <input type="checkbox" v-model="showNetCafe" @change="onChangeNetcafe">ネットカフェも表示 )
        </span>
      </div>
      <div v-if="!pcMode">
        <span ><i class="icon-mobile" aria-hidden="true"></i>スマホの充電に適したお店を表示しています</span>
      </div>
    </div>
    <div class='momenu__expanded' v-show='showMore'>
      <section class='contact'>
        <article>
          <a :href="`https://oasis.mogya.com/contribute?ll=${this.lat},${this.lng}&z=${this.zoom}`" >
            <h2 >
              <i class="icon-map-pin" aria-hidden="true"></i>
              スポットを追加
            </h2>
            <ul >
              <li>地図に載っていないお店の情報を投稿します。お店の方からの投稿も歓迎しております</li>
            </ul>
          </a>
        </article>
        <article>
          <h2>
            <i class="icon-pencil" aria-hidden="true"></i>
            情報の修正
          </h2>
          <ul>
            <li>閉店していた/情報が間違っている/電源つかえなかった などの報告は、詳細ページのコメント欄にお願いします</li>
          </ul>
        </article>
        <article>
          <a href="https://spreadsheets.google.com/embeddedform?formkey=dDhEbF9zUF9LTVd4M1BRRVlXRllBM2c6MQ">
            <h2>
                <i class="icon-mail" aria-hidden="true"></i>
                その他のお問い合わせ
            </h2>
            <ul>
              <li>問題の報告/ご意見ご感想</li>
            </ul>
          </a>
        </article>
      </section>
    </div>
  </div>
</template>

<style lang="scss">
.momenu {
  background-color: #FFF;
  .row{
    padding-left:20px;
    padding-right:20px;
    margin-bottom: 10px;
  }
  &__explain{
    div{
      display: flex;
      flex-wrap: wrap;
      span{
        display: block;
      }
    }
  }
  &__button{
    width: 30%;
    float: left;
    padding-left: 5px;
    &:first-child {
      padding-left: 0;
    }
    .btn{
      border-color: #aaa;
      padding: 0px 12px;
      text-align: center;
      width:100%;
      i {
        display: block;
        font-size: 1.5em;
      }
      span {
        display: block;
      }
    }
  }
  &__button--small{
    padding-left: 15px;
    text-align: right;
    width: 40%;
    .btn{
      text-align: center;
    }
  }
  h2{
    margin-bottom: 0;
  }
  ul{
    margin-top: 0;
  }
  li{
    list-style: none;
  }
  .contact article{
    border: 1px solid #CCC;
    border-radius: 15px;
  }
}
</style>

<script>
import MoUrlParams from '@/components/MoUrlParams.js';
const urlParams = new MoUrlParams();

export default {
  name: 'MoMenu',
  data(){
    return {
      showMore: false,
      pcMode: this.initial.pcMode,
      showNetCafe: this.initial.showNetCafe,
      phoneCareer: [],
      lat: urlParams.getLat(),
      lng: urlParams.getLng(),
      zoom: urlParams.get('z')
    }
  },
  props:{
    initial: {type:Object, required:false,
      default:()=>{
        return {
          pcMode: false,
          showNetCafe: false,
        }
      }
    },
  },
  methods: {
    onClickMore(){
      // urlParamsの更新を検知する案がないので、仮実装
      this.lat = urlParams.getLat()
      this.lng = urlParams.getLng()
      this.zoom = urlParams.get('z')

      this.showMore = !this.showMore
      this.$nextTick(()=>{
        this.$emit('menuOpened', this.showMore);
      });
    },
    onClickPcMode(mode){
      ga('send', 'event', 'map', 'pcModeChanged', '', mode);
      this.pcMode = mode
      this.onChanged();
    },
    onChangeNetcafe(){
      ga('send', 'event', 'map', 'netcafeChanged', '', this.showNetCafe);
      this.onChanged();
    },
    onChanged(){
      this.$emit('changed');
    }
  }
};
</script>

