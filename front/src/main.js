import Vue from 'vue';
import App from './App.vue';
import Promise from 'promise-polyfill';

if (!window.Promise) {
  window.Promise = Promise;
}
new Vue({
  el: '#wrapper',
  components: {
    App: App
  },
});
