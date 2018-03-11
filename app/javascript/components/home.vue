<template>
  <div class="main">
    <div class="title">
      <h1>Game Review</h1>
      <input placeholder="Search for a game, developer or publisher">
    </div>
    <div class="home-tiles">
      <carousel>
        <slide>
          <cards></cards>
        </slide>
      </carousel>
    </div>
  </div>
</template>

<script>

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
    color: white
  input
    margin-top: 60px
    font-family: 'Mina', sans-serif
    width: 1000px
    height: 100px
    box-sizing: border-box
    border: 2px solid #ccc
    border-radius: 4px
    font-size: 26px
    text-align: center
    background-color: white
    background-position: 10px 10px
    background-repeat: no-repeat
</style>
