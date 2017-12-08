<template>
<div class="main">
  <h1>Game Review Site Title</h1>
  <input placeholder="Search...">
  <h2>Top Rated</h2>
  <carousel>
    <slide>
      <cards></cards>
    </slide>
  </carousel>
</div>
</template>

<script>

</script>

<style scoped lang="sass">
*
  font-family: Helvetica, Verdana, sans-serif

.main
  text-align: center
  input
    width: 130px
    box-sizing: border-box
    border: 2px solid #ccc
    border-radius: 4px
    font-size: 16px
    background-color: white
    background-position: 10px 10px
    background-repeat: no-repeat
    padding: 12px 20px 12px 40px
    -webkit-transition: width 0.4s ease-in-out
    transition: width 0.4s ease-in-out
  input:focus
    width: 100%
</style>
