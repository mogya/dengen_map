import Vue from 'vue';
import VueRouter from 'vue-router'
import MapView from './map.vue';
import ContributeView from './contribute.vue';
import Promise from 'promise-polyfill';
import './assets/bootstrap/css/bootstrap.min.css';
import './assets/fontello/css/fontello.css';

if (!window.Promise) {
  window.Promise = Promise;
}

Vue.use(VueRouter);
const routes = [
  { path: '/map', component: MapView },
  { path: '/map/:mapname', component: MapView },
  { path: '/contribute', component: ContributeView }
];
const router = new VueRouter({
  mode: 'history',
  routes
});
const app = new Vue({
  router
}).$mount('#wrapper');
