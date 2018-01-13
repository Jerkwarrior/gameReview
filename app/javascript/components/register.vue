<template lang="html">
  <div class="register">
    <p v-html='registerHtml'>{{registerHtml}}</p>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      registerHtml: ''
    }
  },
  created() {
    this.axios.get('users/sign_up')
    .then(response => {
      this.registerHtml = response.data
      console.log(this.registerHtml);
      return this.registerHtml
    })
    .catch(e => {
      this.errors.push(e)
    })
  }

}
</script>

<style lang="sass">
</style>
