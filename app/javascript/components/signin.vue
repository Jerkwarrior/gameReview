<template lang="html">
  <div class="signin">
    <h2>{{error_message[0]}}</h2>
    <p>Email:</p></br>
    <input v-model="signinForm.email" class="input" type="email"></br>
    <p>Password:</p></br>
    <input v-model="signinForm.password" class="input" type="password"></br>
    <p>Submit:</p></br>
    <input v-on:click="submit()" type="submit" value="submit">
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      signinForm: {
        username: '',
        email: '',
        password: ''
      },
      error_message: ''
    }
  },
  methods: {
    submit: function () {
      this.$store.dispatch('signIn', this.signinForm)
    }
  }
}
</script>

<style lang="sass">
</style>
