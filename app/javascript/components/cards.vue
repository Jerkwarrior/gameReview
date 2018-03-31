<template>
  <div class="game-card">
    <h3>{{game.name}}</h3>
    <img v-bind:src="game.cover_big">
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
  width: 50%
  padding: 1%
  h3
    text-align: center
</style>
