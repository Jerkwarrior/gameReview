<template>
<div class="game-info">
  <div class="main">
    <h1>{{game.name}}</h1>
    <div class="left">
      <img src= 'https://igdb.spacechop.com/igdb/image/upload/t_cover_big/pvcxrnssrbmzipz5h3wq.jpg' alt=""></img>
    </div>
    <div class="right">
      <p>{{game.summary}}</p>
      <ul>
        <li>First released: {{game.release_date_human}}</li>
        <li>Game Modes: {{game.game_modes[0].name}}</li>
        <!-- <li>platforms: {{game.platforms.first.name}}</li>
        <li>{{game.perspectives.first.name}} {{game.themes.first.name}} {{game.keywords.first.name}}</li> -->
      </ul>
    </div>
</div>
</div>
</template>

<script>
export default {
  data: function() {
    return {game: []}
  },
  created() {
    this.axios.get('games/6')
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
      list-style: none
</style>
