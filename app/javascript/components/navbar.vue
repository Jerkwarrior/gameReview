<template>
  <div class="nav-wrapper">
    <nav class="navbar">
      <router-link to="/">Home</router-link>
      <router-link to="/games">Games</router-link>
      <router-link to="/developers">Developers</router-link>
      <router-link to="/publishers">Publishers</router-link>
      <router-link to="/register">Register</router-link>
      <router-link to="/signout">Sign out</router-link>
      <router-link to="/signin">Sign in</router-link>
      <input class="searching" placeholder="Search...">
    </nav>
</div>
</template>

<script>
export default {
  data () {
    return {activeItem: 'home'}
  },
  methods: {
    isActive: function (menuItem) {
      return this.activeItem === menuItem
    },
    setActive: function (menuItem) {
      this.activeItem = menuItem
    }
  }
}
</script>

<style scoped lang="sass">
  *
    margin: 0
    padding: 0
    font-family: 'Mina', sans-serif

  .nav-wrapper
    padding: 50px
    text-align: center
    .navbar
      font-size: 16px
      a
        text-decoration: none
        color: white
        padding-right: 30px
      a:hover
        color: blue
      nav
      .router-link-exact-active
        cursor: pointer
        color: blue
</style>
