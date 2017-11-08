<template>
<div>
  <div class="top">
    <h1>{{game.name}}</h1>
    <img src="//images.igdb.com/igdb/image/upload/t_cover_big/pvfqdvjvplypr3a0y6bh.jpg" alt=""></img>
    <div class="top-right">
      <ul>
        <li>First released: {{game.release_date_human}}</li>
        <li>Game Modes: {{game.game_modes}}</li>
        <li>platforms: {{game.platforms}}</li>
        <li>{{game.player_perspectives}} {{game.themes}} {{game.keywords}}</li>
      </ul>
      <!-- <p>Developers:</p>
      <a href="#">Developers</a>
      <p>publishers:</p>
      <a href="#">Publishers</a>
      <p>First Released:</p>
      <p>Game Modes:</p>
      <p>Player Perspective:</p>
      <p>Genre:</p>
      <p>Theme:</p>
      <p>Keywords:</p>
      <p>platforms:</p>
      <p>Game Engine:</p> -->
    </div>
  </div>
  <div class="middle">
    <!--Screenshots and Video here in gallery  -->
  </div>
  <div class="bottom">
    <p>{{game.summary}}</p>
  </div>
</div>
</template>

<script>
export default {
  data: function() {
    return {game: []}
  },
  created() {
    this.axios.get('games/75087')
    .then(response => {
      console.log(response.data);
      this.game = response.data
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}
</script>

<style scoped lang="sass">
*
  font-family: Helvetica, Verdana, sans-serif
  margin-left: 25px
.top
  width: 40%
  .top-right
    margin-left: 50px
    display: inline-block
</style>
