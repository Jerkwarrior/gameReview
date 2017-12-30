<template>
<div class="game-info">
  <div class="main">
    <h1>{{game.name}}</h1>
    <div class="left">
      <img v-bind:src="game.cover_big">
    </div>
    <div class="right">
      <p>{{game.summary}}</p>
      <ul>
        <li>First released: {{game.release_date_human}}</li>
        <li v-for="modes in game.game_modes">Game Modes: {{modes.name}}</li>
        <p>Platforms:</p>
        <li v-for="platform in game.platforms">{{platform.name}}</li>
        <p>Game perspectives:</p>
        <li v-for="persp in game.perspectives">{{persp.name}}</li>
        <p>Themes:</p>
        <li v-for="theme in game.themes">{{theme.name}}</li>
      </ul>
    </div>
</div>
</div>
</template>

<script>
export default {
  props: { game_id: Number
  },
  data: function() {
    return {game: []}
  },
  created() {
    this.axios.get('games/' + this.game_id)
    .then(response => {
      this.game = response.data;
      console.log(this.game);
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}
</script>

<style scoped lang="sass">

.game-info
  font-family: Helvetica, Verdana, sans-serif
  margin-left: 25px
.main
  overflow: hidden
  width: 50%
  border: 5px solid
  padding: 1%
  h1
    text-align: center
  .left
    float: left
    margin-right: 5%
  .right
    li
      display: inline
      list-style: none
    li:after
      content: ", "
    li:last-child:after
      content: ""
</style>
