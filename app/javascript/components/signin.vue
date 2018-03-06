<template lang="html">
  <div class="signin">
    <h2>{{error_message[0]}}</h2>
    <!-- <p>Username:</p></br>
    <input v-model="signinForm.username" class="input" type="test"></br> -->
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
      let self = this
      this.axios.post('auth/sign_in', this.signinForm)
      .then(response => {
        const status = response.status
        if (status === 200) {
          self.$router.push('/')
        }
      })
      .catch(error => {
        this.error_message = error.response.data.errors
      })
    }
  }
}
</script>

<style lang="sass">
</style>
