<template lang="html">
  <div class="signout">
    <button v-on:click='logout()' type="button">LOGOUT</button>
  </div>
</template>

<script>
export default {
  methods: {
    logout () {
      this.axios.get('/auth/sign_out')
      .then(function (response) {
        console.log(response)
      })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>

<style lang="sass">
</style>
