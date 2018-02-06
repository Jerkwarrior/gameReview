<template lang="html">
  <div class="login">
    <p v-html='signinHtml'>{{signinHtml}}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      signinHtml: ''
    }
  },
  created () {
    this.axios.get('users/sign_in')
    .then(response => {
      this.signinHtml = response.data
      console.log(this.signinHtml)
      return this.signinHtml
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}
</script>

<style lang="sass">
</style>
