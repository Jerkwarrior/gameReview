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
        <li>Platforms: {{game.platforms[0].name}}</li>
        <li>Perspectives: {{game.perspectives[0].name}}</li>
        <li>Themes: {{game.themes[0].name}}</li>
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
      list-style: none
</style>
