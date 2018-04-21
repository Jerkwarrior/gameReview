<template>
<div class="game-info">
  <div class="left">
    <h1>{{game.name}}</h1>
    <img v-bind:src="game.cover_big">
  </div>
  <div class="center">
    <div class="center-buttons">
      <!-- <button type="button" name="button">Review Game</button> -->
      <router-link :to="{ name: 'review', params: {gameId: game.id} }" tag="button">Review Game</router-link>
      <button type="button" name="button">Go Back</button>
      <button type="button" name="button">Share</button>
    </div>
    <p>{{game.summary}}</p>
  </div>
  <div class="right">
    <!--Review section: see mockup  -->
    <p>Reviews!</p>
  </div>
  <!-- <div class="main">
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
  </div> -->
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
  background-color: #001B26
  text-align: center
  margin: 1%
  padding: 2%
  display: inline-block
  border-radius: 25px
  // font-family: 'Exo 2', sans-serif
  color: #FDFDFD

  .left
    float: left
    width: 30%
    h1
      margin-top: 0
      font-size: 60px
      font-family: 'Exo 2', sans-serif

  .center
    float: left
    width: 35%
    p
      font-size: 16px
      font-family: 'Roboto', sans-serif

    .center-buttons
      height: 56px
      align-items: center
      vertical-align: middle
      margin-bottom: 40px
      padding-top: 16px
      button
        height: 35px
        width: 150px
        margin-right: 30px
        border: none
        border-radius: 10px
        font-size: 16px
        font-family: 'Exo 2', sans-serif
        color: #FDFDFD
        background-color: #004059

  .right
    float: left
    width: 35%



// .main
//   overflow: hidden
//   width: 50%
//   border: 5px solid
//   border-color: #FDFDFD
//   padding: 1%
//   h1
//     text-align: center
//   .left
//     float: left
//     margin-right: 5%
//   .right
//     p
//       display: inline
//     li
//       display: inline
//       list-style: none
//     li:after
//       content: ", "
//     li:last-child:after
//       content: ""
</style>
