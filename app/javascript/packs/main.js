/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you set extractStyles to true
// in config/webpack/loaders/vue.js) to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   document.body.appendChild(document.createElement('hello'))
//   const app = new Vue(App).$mount('hello')
//
//   console.log(app)
// })

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import store from './store'
import VueRouter from 'vue-router'
import VueCarousel from 'vue-carousel'
import VuePaginate from 'vue-paginate'
import VueSlider from 'vue-slider-component'
import Navbar from 'components/navbar'
import Home from 'components/home'
import Games from 'components/games'
import Developers from 'components/developers'
import Publishers from 'components/publishers'
import GameInfo from 'components/game-info'
import Review from 'components/review'
import Register from 'components/register'
import Signin from 'components/signin'
import Signout from 'components/signout'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Cards from 'components/cards'
import Search from 'components/search'

Vue.use(VueAxios, axios)
Vue.use(Vuex)
Vue.use(VueRouter)
Vue.use(VueCarousel)
Vue.use(VuePaginate)
Vue.use(VueSlider)

// 0. If using a module system, call Vue.use(VueRouter)

// 1. Define route components.
// These can be imported from other files

Vue.component('game-info', GameInfo)
Vue.component('game-card', Cards)
Vue.component('search', Search)
Vue.component('review', Review)
Vue.component('navbar', Navbar)
Vue.component('vue-slider', VueSlider)

// 2. Define some routes
// Each route should map to a component. The "component" can
// either be an actual component constructor created via
// Vue.extend(), or just a component options object.
// We'll talk about nested routes later.
const routes = [
  { path: '/', component: Home },
  { path: '/games', component: Games },
  { path: '/game/:gameId', name: 'game', component: GameInfo, props: true },
  { path: '/game/:gameId/review', name: 'review', component: Review, props: true },
  { path: '/developers', component: Developers },
  { path: '/publishers', component: Publishers },
  { path: '/register', component: Register },
  { path: '/signin', component: Signin },
  { path: '/signout', component: Signout }
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = new VueRouter({
  routes
})

// 4. Create and mount the root instance.
// Make sure to inject the router with the router option to make the
// whole app router-aware.
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    // el: '#app',
    store,
    data: {
    },
  }).$mount('#app')
})
// Now the app has started!
