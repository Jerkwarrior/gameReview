<template lang="html">
  <div class="signout">
    <button v-on:click='logout()' type="button">LOGOUT</button>
  </div>
</template>

<script>
export default {
  methods: {
    logout () {
      this.$store.dispatch('signOut')
        .then(response => {
          this.$router.push('/')
        }, error => {
          console.log(error)
        })
    }
  }
}
</script>

<style lang="sass">
</style>
