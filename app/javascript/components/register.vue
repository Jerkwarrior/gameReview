<template lang="html">
  <div class="register">
    <!-- username, email, password -->
    <h1>REGISTER</h1>
    <form>
      Username: <br>
      <input type="text" v-model="username">{{username}} <br>
      Email Address: <br  >
      <input type="email" v-model="email">{{email}} <br>
      Password: <br>
      <input type="password" v-model="password">{{password}} <br>
      <input type="submit" name="" value="Submit">
    </form>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="sass">
</style>
