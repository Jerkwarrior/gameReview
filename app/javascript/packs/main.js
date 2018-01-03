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
import VueRouter from 'vue-router'
import VueCarousel from 'vue-carousel'
import Navbar from 'components/navbar'
import Home from 'components/home'
import Games from 'components/games'
import Developers from 'components/developers'
import Publishers from 'components/publishers'
import gameInfo from 'components/gameInfo'
import Register from 'components/register'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Cards from 'components/cards'

Vue.use(VueAxios, axios);
Vue.use(VueRouter);
Vue.use(VueCarousel);

// 0. If using a module system, call Vue.use(VueRouter)

// 1. Define route components.
// These can be imported from other files

Vue.component('game-info', gameInfo);
Vue.component('cards', Cards);

// 2. Define some routes
// Each route should map to a component. The "component" can
// either be an actual component constructor created via
// Vue.extend(), or just a component options object.
// We'll talk about nested routes later.
const routes = [
  { path: '/', component: Home },
  { path: '/games', component: Games },
  { path: '/developers', component: Developers },
  { path: '/publishers', component: Publishers },
  { path: '/register', component: Register}
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
document.addEventListener( 'DOMContentLoaded', () =>  {
  const app = new Vue({
    router,
    el: '#app',
    data: {
    },
    components: { navbar: Navbar}
})
})
// Now the app has started!
