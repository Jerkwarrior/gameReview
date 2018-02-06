<template lang="html">
  <div class="logout">
    <button v-on:click='logout()' type="button">LOGOUT</button>
  </div>
</template>

<script>
export default {
  methods: {
    logout () {
      this.axios.get('/users/signout')
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
