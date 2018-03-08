import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(Vuex)
Vue.use(VueAxios, axios)

const store = new Vuex.Store({
  state: {
    // May be uneccessary
    // user: null,
    idToken: null,
    client: null,
    username: null,
    email: null
  },

  actions: {
    signUp ({commit}, authData) {
      axios.post('auth/', authData)
        .then(response => {
          commit('setUser', {
            username: response.data.data.username,
            email: response.data.data.email
          })
          if (response.status === 200) {
            this.$router.push('/')
            window.alert('Success!')
          }
        })
        .catch(error => {
          console.log(error)
          // return error.response.data.errors.full_messages
        })
    },

    signIn ({commit}, authData) {
      axios.post('auth/sign_in', authData)
        .then(response => {
          commit('setUser', {
            username: response.data.data.username,
            email: response.data.data.email,
            idToken: response.headers['access-token'],
            client: response.headers['client']
          })
          if (response.status === 200) {
            this.$router.push('/')
            window.alert('Success!')
          }
          // The line below may be uneccessary
          // commit('storeUser', response.data)
        })
        .catch(error => {
          console.log(error)
        })
    },

    signOut () {
      axios({
        method: 'get',
        url: 'auth/sign_out',
        headers: store.getters.signOutUserHeaders
      })
        .then(response => {
          console.log(response)
          store.commit('unsetUser')
        })
        .catch(error => {
          console.log(error)
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
    // The mutation below may be uneccessary
    // storeUser (state, user) {
    //   state.user = user
    // }
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
