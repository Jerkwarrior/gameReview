<template>
  <div>
    <div class="game-card">
    <img src="//images.igdb.com/igdb/image/upload/t_cover_big/pvfqdvjvplypr3a0y6bh.jpg" alt=""></img>
      <!-- <img>{{game.cover_url}}</img> -->
      <div class="popout">
        <ul>
          <li><span>{{game.name}}</span></li>
          <li>Developer: {{game.developer}}</li>
          <li>Publisher: {{game.publisher}}</li>
          <li>Platforms: {{game.platforms}}</li>
          <li>Release Date: {{game.release_date_human}}</li>
          <li>Genre: <!-- {{game.genre}}--></li>
        </ul>
        <div class="popout-bottom">
          <p>7<!--review score--></p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {game: []}
  },
  created () {
    this.axios.get('games/20')
    .then(response => {
      console.log(response.data)
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
    margin: 5px
    padding: 5px
    width: 13%
    background-color: black
    img
      display: block
      width: 100%
    &:hover
      .popout
          visibility: visible
          padding: 20px
    .popout-bottom
      width: 100px
      height: 100px
      background-color: lightgreen
      border-radius: 50%
      text-align: center
      margin: 0 auto
      p
        position: relative
        top: 50%
        transform: translateY(-50%)
        font-size: 1.8rem
    .popout
      visibility: hidden
      text-align: left
      border: 2px solid lightgreen
      position: absolute
      z-index: 1
      ul
        list-style-type: none
        padding-right: 40px
        li
          padding-top: 10px
          span
            font-size: 1.5rem
            font-weight: bold
  // .card-3
  //   width: 33%
  //   @media only screen and (max-width: 1000px)
  //     width: 50%
  //   @media only screen and (max-width: 750px)
  //     width: 75%
  //   @media only screen and (max-width: 500px)
  //     width: 100%
  //
  // .card-4
  //   width: 25%
  //   @media only screen and (max-width: 1000px)
  //     width: 33%
  //   @media only screen and (max-width: 750px)
  //     width: 50%
  //   @media only screen and (max-width: 500px)
  //     width: 100%
  //
  // .card-5
  //   width: 20%
  //   @media only screen and (max-width: 1000px)
  //     width: 25%
  //   @media only screen and (max-width: 750px)
  //     width: 33%
  //   @media only screen and (max-width: 500px)
  //     width: 50%
  //   @media only screen and (max-width: 330px)
  //     width: 100%
  //
  // .card-6
  //   width: 16%
  //   @media only screen and (max-width: 1000px)
  //     width: 20%
  //   @media only screen and (max-width: 750px)
  //     width: 25%
  //   @media only screen and (max-width: 500px)
  //     width: 50%
  //   @media only screen and (max-width: 330px)
  //     width: 100%
</style>
