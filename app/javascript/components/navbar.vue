<template>
  <nav>
      <ul>
        <li @click="setActive('home')" :class="{ active: isActive('home') }">
          <router-link to="/">Home</router-link>
        </li>
        <li @click="setActive('games')" :class="{ active: isActive('games') }">
          <router-link to="/games">Games</router-link>
        </li>
        <li @click="setActive('developers')" :class="{ active: isActive('developers') }">
          <router-link to="/developers">Developers</router-link>
        </li>
        <li @click="setActive('publishers')" :class="{ active: isActive('publishers') }">
          <router-link to="/publishers">Publishers</router-link>
        </li>
        <li @click="setActive('register')" :class="{ active: isActive('register') }">
          <router-link to="/register">Register</router-link>
        </li>
        <li @click="setActive('signout')" :class="{ active: isActive('signout') }">
          <router-link to="/signout">Sign out</router-link>
        </li>
        <li @click="setActive('signin')" :class="{ active: isActive('signin') }">
          <router-link to="/signin">Sign in</router-link>
        </li>
        <input class="searching" placeholder="Search...">
      </ul>
  </nav>
</template>

<script>
export default {
  data () {
    return {activeItem: 'home' }
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
nav
  margin: 50px
  ul
    overflow: auto
    list-style-type: none
  li
    height: 25px
    float: left
    margin-right: 0px
    border-right: 1px solid #aaa
    padding: 0 20px
    &:last-child
      border-right: none
    a
      text-decoration: none
      color: #ccc
      font: 20px/1 Helvetica, Verdana, sans-serif
      text-transform: uppercase
      -webkit-transition: all 0.5s ease
      -moz-transition: all 0.5s ease
      -o-transition: all 0.5s ease
      -ms-transition: all 0.5s ease
      transition: all 0.5s ease
      &:hover
        color: #999
    &.active a
      font-weight: bold
      color: #333
</style>
