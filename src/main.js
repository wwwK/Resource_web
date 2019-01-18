import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui'
import '../node_modules/element-ui/lib/theme-chalk/index.css'
import router from './router'
import some from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.min.css'


Vue.use(ElementUI,some);

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
}).$mount('#app')
