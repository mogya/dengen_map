import Vue from 'vue';
import VueRouter from 'vue-router'
import MapView from '@/pages/map.vue';
import TagsView from '@/pages/tags.vue';
import ContributeView from '@/pages/contribute.vue';
import '@/assets/bootstrap/css/bootstrap.min.css';
import '@/assets/fontello/css/fontello.css';


Vue.use(VueRouter);
const routes = [
  { path: '/index.html', component: MapView },
  { path: '/map', component: MapView },
  { path: '/tags', component: TagsView },
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
