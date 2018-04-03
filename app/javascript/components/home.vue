<template>
  <div class="main">
    <div class="search-wrapper">
      <search></search>
    </div>

    <!-- <div class="home-info-wrapper">
      <div class="info-box">
        <img src="app/assets/images/assassingrey.png" alt="">
        <p>Search for your favourite games and review them</p>
      </div>
      <div class="info-box">
        <p>Reviews are broken down to allow you to focus on what matters</p>
      </div>
      <div class="info-box">
        <p>Reviews are reflected on the games developers and publishers involved</p>
      </div>
    </div> -->

    <div class="home-tiles">
      <carousel per-page="4">
        <slide>
          <game-card gameId=5></game-card>
        </slide>
        <slide>
          <game-card gameId=6></game-card>
        </slide>
        <slide>
          <game-card gameId=10></game-card>
        </slide>
        <slide>
          <game-card gameId=13></game-card>
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
  color: #1a1a1a
  text-align: center
  vertical-align: top
  background-image: image-url('tetris_wallpaper_by_perfectzed.png.jpeg')
  background-size: 100%

  .search-wrapper
    background-color: #1a1a1a
    border: 2px solid
    height: 300px
    margin-left: 10%
    margin-right: 10%
    border-radius: 25px
    padding: 40px
    display: flex
    align-items: center
    justify-content: center
    text-align: center
    margin-bottom:  60px
    margin-top: 60px

  // .home-info-wrapper
  //   font-family: 'Noto-sans', sans-serif
  //   font-weight: normal
  //   display: inline-block
  //   margin-bottom: 30px
  //   .info-box
  //     background-color: #1a1a1a
  //     font-family: 'Mina', sans-serif
  //     border: 1px solid
  //     border-radius: 25px
  //     float: left
  //     margin-right: 50px
  //     height: 300px
  //     width: 30%
  //     display: flex
  //     align-items: center
  //     justify-content: center
  //     text-align: center

  .home-tiles
    background-color: #1a1a1a
    color: #fdfdfd



</style>
