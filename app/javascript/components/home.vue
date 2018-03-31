<template>
  <div class="main">
    <div class="title">
      <h1>Game Review</h1>
      <search></search>
    </div>
    <div class="home-tiles">
      <carousel per-page="4">
        <slide>
          <game-card gameId=1></game-card>
        </slide>
        <slide>
          <game-card gameId=2></game-card>
        </slide>
        <slide>
          <game-card gameId=3></game-card>
        </slide>
        <slide>
          <game-card gameId=5></game-card>
        </slide>
      </carousel>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    // return {image: null}
  },
  methods: {
    getGames: function () {
      this.axios.get('games')
        .then(response => {
          this.searchData = response.data
        })
    }
  }
}

</script>

<style scoped lang="sass">
*
  font-family: 'Noto-sans', sans-serif
  font-weight: normal
  margin: 0

.main
  text-align: center
  vertical-align: top
  .title
    font-size: 50px
    h1
      font-family: 'Orbitron', sans-serif
</style>
