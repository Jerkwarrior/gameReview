<template lang="html">
  <div class="register">
    <h2>{{error_message}}</h2>
    <p>Username:</p></br>
    <input v-model="registerForm.username" class="input" type="test"></br>
    <p>Email:</p></br>
    <input v-model="registerForm.email" class="input" type="email"></br>
    <p>Password:</p></br>
    <input v-model="registerForm.password" class="input" type="password"></br>
    <p>Confirm Password:</p></br>
    <input v-model="password_confirm" class="input" type="password"></br>
    <p>Submit:</p></br>
    <input v-on:click="submit()" type="submit" value="submit">
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      registerForm: {
        username: '',
        email: '',
        password: ''
      },
      password_confirm: '',
      error_message: ''
    }
  },
  methods: {
    submit: function () {
      if (this.registerForm.password !== this.password_confirm) {
        this.error_message = 'Passwords do not match, try again.'
      } else {
        this.$store.dispatch('signUp', this.registerForm)
          .then(response => {
            if (response.status === 200) {
              this.$router.push('/')
              window.alert('Success, Please check your email!')
            }
          }, error => {
            this.error_message = error.response.data.errors.full_messages
          })
      }
    }
  }
}
</script>

<style lang="sass">
</style>
