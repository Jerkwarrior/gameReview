<template>
  <div class="main">
    <div class="title">
      <h1>Game Review</h1>
      <search></search>
    </div>
    <div class="home-tiles">
      <carousel>
        <slide>
          <!-- <cards></cards> -->
        </slide>
      </carousel>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    // return {image: null}
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
