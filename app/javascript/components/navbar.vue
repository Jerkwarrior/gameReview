<template>
	<nav>
	    <ul>
	      <li>
	        <router-link to="/">Home</router-link>
	      </li>
				<li>
	        <router-link to="/games">Games</router-link>
	      </li>
				<li>
					<router-link to="/developers">Developers</router-link>
				</li>
				<li>
					<router-link to="/publishers">Publishers</router-link>
				</li>
	    </ul>
		<!-- route outlet -->
		<!-- component matched by the route will render here -->
  </nav>
</template>

<script>
export default {
	data: function() {
		return {
		
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
          color: #666
      &.active a
        font-weight: bold
        color: #333
</style>
