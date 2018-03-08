import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
// import VueAxios from 'vue-axios'

Vue.use(Vuex)
Vue.use(axios)
// Vue.use(VueAxios, axios)

const store = new Vuex.Store({
  state: {
    idToken: null,
    client: null,
    username: null,
    email: null
  },

  actions: {
    signUp ({commit}, authData) {
      return new Promise((resolve, reject) => {
        axios.post('auth/', authData)
          .then(response => {
            commit('setUser', {
              username: response.data.data.username,
              email: response.data.data.email
            })
            resolve(response)
          })
          .catch(error => {
            reject(error)
          })
      })
    },

    signIn ({commit}, authData) {
      return new Promise((resolve, reject) => {
        axios.post('auth/sign_in', authData)
          .then(response => {
            commit('setUser', {
              username: response.data.data.username,
              email: response.data.data.email,
              idToken: response.headers['access-token'],
              client: response.headers['client']
            })
            resolve(response)
          })
          .catch(error => {
            reject(error)
          })
      })
    },

    signOut () {
      return new Promise((resolve, reject) => {
        axios({
          method: 'get',
          url: 'auth/sign_out',
          headers: store.getters.signOutUserHeaders
        })
          .then(response => {
            store.commit('unsetUser')
            resolve(response)
          })
          .catch(error => {
            reject(error)
          })
      })
    }
  },

  mutations: {
    setUser (state, userData) {
      state.idToken = userData.idToken
      state.client = userData.client
      state.username = userData.username
      state.email = userData.email
    },
    unsetUser (state) {
      state.idToken = null
      state.client = null
      state.username = null
      state.email = null
    }
  },

  getters: {
    signOutUserHeaders (state) {
      var header = {
        uid: state.email,
        client: state.client,
        'access-token': state.idToken
      }
      return header
    }
  }
})
export default store
