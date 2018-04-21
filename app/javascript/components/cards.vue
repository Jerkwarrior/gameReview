<template>
  <div class="game-card">
    <div class="title">
      <router-link :to="{ name: 'game', params: {gameId: game.id} }">{{game.name}}</router-link>
    </div>
    <div class="image">
      <img v-bind:src="game.cover_big">
    </div>
  </div>
</template>

<script>
export default {
  props: { gameId: Number
  },
  data: function () {
    return {game: []}
  },
  created () {
    this.axios.get('games/' + this.gameId)
      .then(response => {
        this.game = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
  }
}
</script>

<style scoped lang="sass">
.game-card
  background-color: #1A1A1A
  width: 300px
  height: 450px
  margin: 20px
  padding: 40px
  text-align: center
  align-content: center
  float: left
  .title
    height: 80px
    a
      font-family: 'Exo 2', sans-serif
      font-size: 30px
      color: #FDFDFD
      text-decoration: none
</style>
