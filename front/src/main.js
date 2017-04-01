import Vue from 'vue';
import App from './App.vue';
import Promise from 'promise-polyfill';
import './assets/bootstrap/css/bootstrap.min.css';
import './assets/fontello/css/fontello.css';

if (!window.Promise) {
  window.Promise = Promise;
}
new Vue({
  el: '#wrapper',
  components: {
    App: App
  },
});
