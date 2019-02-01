import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui'
import '../node_modules/element-ui/lib/theme-chalk/index.css'
import router from './router'
import api from './apiconfig'
import $ from 'jquery'
import echarts from 'echarts'

Vue.prototype.api = api;
Vue.prototype.$ = $;
Vue.prototype.$echarts = echarts 

Vue.use(ElementUI);

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
}).$mount('#app')
