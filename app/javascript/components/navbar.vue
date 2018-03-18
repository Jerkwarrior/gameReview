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
    padding: 20px
    margin-bottom: 50px
    text-align: center
    .navbar
      font-size: 16px
      a
        text-decoration: none
        padding-right: 30px
        padding-left: 10px
        color: #FDFDFD
      a:hover
        text-shadow: 0 0 .65px white
      nav
      .router-link-exact-active
        cursor: pointer
        color: white
        font-weight: bold
</style>
