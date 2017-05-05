<template>
  <div class='momenu'>
    <div class='momenu__default'>
      <div class='momenu__button'>
        <a class="btn btn-default" :class="{ active:!pcMode }" href="#" @click="onClickPcMode(false)">
          <i class="icon-mobile" aria-hidden="true"></i>
          <span v-if='showMore'>充電</span>
        </a>
      </div>
      <div class='momenu__button'>
        <a class="btn btn-default" :class="{ active:pcMode }" href="#" @click='onClickPcMode(true)'>
          <i class="icon-laptop" aria-hidden="true"></i>
          <span v-if='showMore'>パソコン</span>
        </a>
      </div>
      <div class='momenu__button'>
        <a class="btn btn-default" href="#" role="button" v-if='!showMore' @click='onClickMore'>
          <i class="icon-caret-down" aria-hidden="true"></i>
          <span v-if='showMore'>More</span>
        </a>
        <a class="momenu__button col-xs-4 btn btn-default" href="#" role="button" v-if='showMore' @click='onClickMore'>
          <i class="icon-caret-up" aria-hidden="true"></i>
          <span>Less</span>
        </a>
      </div>
    </div>
    <div class='momenu__explain' >
      <span v-if="pcMode">パソコンで仕事をするのに適したお店を表示しています</span>
      <span v-if="!pcMode">スマホの充電に適したお店を表示しています</span>
    </div>
    <div class='momenu__expanded' v-if='showMore'>
      <div class='row' v-if='pcMode'>
        <div>
          <label>
            <input type="checkbox" v-model="showNetCafe" @change="onChangeNetcafe">ネットカフェも表示
          </label>
        </div>
      </div>
      <div class='row' v-if='!pcMode'>
      <!--
        <div>
          <label><input type="checkbox" id='docomo' value='docomo' v-model='phoneCareer'>ドコモ</label>
          <label><input type="checkbox" id='au' value='au' v-model='phoneCareer'>AU</label>
          <label><input type="checkbox" id='softbank' value='softbank' v-model='phoneCareer'>ソフトバンク</label>
        </div>
      -->
      </div>
      <div class='row' >
        <ul class='manual'>
          <li> 充電：スマホの充電に適したお店が表示されます(コワーキングスペースなどが除外されます) </li>
          <li> パソコン：パソコンで仕事をするのに適したお店が表示されます(ココイチや充電スタンドなどが除外されます) </li>
        </ul>
      </div>
      <div class='row' >
        <ul class="list-unstyled">
          <li><a href='//oasis.mogya.com/responsive/icon_comments' target='_blank'>アイコンについて</a></li>
          <li><a href="https://oasis.mogya.com/contrib">情報を追加したい</a></li>
          <li><a href="https://oasis.mogya.com/contact/">不具合の報告</a></li>
        </ul>
      </div>
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
  &__button{
    width: 33.3%;
    float: left;
    padding-left: 5px;
    &:first-child {
      padding-left: 0;
    }
    .btn{
      width:100%;
      text-align: center;
      i {
        display: block;
        font-size: 2em;
      }
      span {
        display: block;
      }
    }
  }
}
</style>

<script>

export default {
  name: 'MoMenu',
  data(){
    return {
      showMore: false,
      pcMode: this.initial.pcMode,
      showNetCafe: this.initial.showNetCafe,
      phoneCareer: [],
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

