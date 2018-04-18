<template lang="html">
  <div class="review">
    <p>Summary</p></br>
    <input v-model="review.summary" type="text" name="summary"></br>
    <p>Gameplay</p></br>
    <input v-model="review.gameplay" type="number" name="gameplay"></br>
    <p>Story</p></br>
    <input v-model="review.story" type="number" name="story"></br>
    <p>Graphics</p></br>
    <input v-model="review.graphics" type="number" name="graphics"></br>
    <p>Immersion</p></br>
    <input v-model="review.immersion" type="number" name="immersion"></br>
    <p>Bugs?</p></br>
    <input v-model="review.bugs" type="checkbox" name="bugs"></br>
    <p>Microtransactions?</p></br>
    <input v-model="review.microtransactions" type="checkbox" name="microtransactions"></br>
    <p>Recommended?</p></br>
    <input v-model="review.recommended" type="checkbox" name="recommended"></br>
    <input v-on:click="submit()" type="submit" value="submit">
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      review: {
        summary: '',
        gameplay: '',
        story: '',
        graphics: '',
        immersion: '',
        bugs: '',
        microtransactions: '',
        recommended: ''
      }
    }
  },
  methods: {
    submit: function () {
      let self = this
      this.axios.post('games/13/reviews', this.review, {
        headers: self.$store.getters.userRequestHeaders
      })
        .then(response => {
          window.alert('SUCCESS!')
          console.log(this.response)
        })
        .catch(e => {
          this.errors.push(e)
        })
    }
  }
}
</script>

<style lang="sass">
  .review
    background-color: #1a1a1a
</style>
