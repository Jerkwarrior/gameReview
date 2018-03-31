<template>
<div class="game-info">
  <div class="main">
    <h1>{{game.name}}</h1>
    <div class="left">
      <img v-bind:src="game.cover_big">
    </div>
    <div class="right">
      <p>{{game.summary}}</p>
      <p>First released: {{game.release_date_human}}</p>
      <ul>
        <li v-for="modes in game.game_modes">{{modes.name}}</li>
      </ul>
      <ul>
        <li v-for="platform in game.platforms">{{platform.name}}</li>
      </ul>
      <ul>
        <li v-for="persp in game.perspectives">{{persp.name}}</li>
      </ul>
      <ul>
        <li v-for="theme in game.themes">{{theme.name}}</li>
      </ul>
    </div>
</div>
</div>
</template>

<script>
export default {
  props: ['gameId'],
  data: function () {
    return {game: []}
  },
  methods: {
    getGameInfo () {
      // console.log('this is the ID ' + this.gameId)
      this.axios.get('games/' + this.gameId)
        .then(response => {
          this.game = response.data
          console.log(this.game)
        })
        .catch(e => {
          this.errors.push(e)
        })
    }
  },
  created () {
    this.getGameInfo()
  }
}
</script>

<style scoped lang="sass">

.game-info
  font-family: 'Mina', sans-serif
  margin-left: 25px
.main
  overflow: hidden
  width: 50%
  border: 5px solid
  border-color: #FDFDFD
  padding: 1%
  h1
    text-align: center
  .left
    float: left
    margin-right: 5%
  .right
    p
      display: inline
    li
      display: inline
      list-style: none
    li:after
      content: ", "
    li:last-child:after
      content: ""
</style>
