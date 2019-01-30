import Vue from 'vue'
import Router from 'vue-router'
import Main from './components/content/main'
import Admin from './components/admin/admin'



Vue.use(Router)

export default new Router({
  mode:"history",
  routes: [
    { path: '/', name: 'home', component: Main },
    { path: '/main', name: 'main', component: Main },
    { path: '/admin',  name: 'admin', component: Admin}

  ]
})