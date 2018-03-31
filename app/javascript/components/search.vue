<template lang="html">
  <div class="search">
    <input placeholder="Search for a game" type="text" v-model="search">
    <div v-if= "search !== ''">
      <div v-for="data in filteredItems">
        <router-link :to="{ name: 'game', params: {gameId: data.id} }">{{data.name}}</router-link>
      </div>
    </div>
  </div >
</template>

<script>
export default {
  // props: {searchData: []},
  data: function () {
    return {
      search: '',
      searchData: []
    }
  },
  methods: {
    getGames: function () {
      this.axios.get('games')
        .then(response => {
          this.searchData = response.data
        })
    }
  },
  beforeMount () {
    this.getGames()
  },
  computed: {
    filteredItems () {
      return this.searchData.filter((game) => {
        return game.name.toLowerCase().match(this.search)
      })
    }
  }
}
</script>

<style lang="sass">
.search
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
    background-color: #FDFDFD
    background-position: 10px 10px
    background-repeat: no-repeat
</style>
