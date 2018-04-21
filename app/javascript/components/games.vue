<template>
  <div class="game">
    <div class="paginate-wrapper">
      <paginate
        name="games"
        :list="games"
        :per="12"
      >
        <ul v-for="game in paginated('games')">
          <div class="card-wrapper">
            <game-card :gameId=game.id></game-card>
            <!-- {{game.name}} -->
          </div>
        </ul>
      </paginate>
    </div>

    <div class="link-wrapper">
      <paginate-links
      for="games"
      :simple="{
        prev: 'Back',
        next: 'Next'
      }"
      ></paginate-links>
    </div>

  </div>
</template>

<script>
export default {
  data: function () {
    return {
      games: [],
      paginate: ['games']
    }
  },
  methods: {
    getGames: function () {
      this.axios.get('games')
        .then(response => {
          this.games = response.data
        })
        .catch(e => {
          this.errors.push(e)
        })
    }
  },
  created () {
    this.getGames()
  }

}
</script>

<style scoped lang="sass">
.game
  .link-wrapper
    width: 100%
    height: 40px
    float: right
    clear: both
    text-align: center
    font-size: 40px
    ul
      list-style-type: none
      // background-color: red

</style>
