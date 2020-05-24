<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="card-deck">
        <Place :key="place.id" v-for="place in places" v-bind:place="place" />
      </div>
    </div>
    <button
      v-if="hasMorePlaces"
      @click="morePlaces"
      type="button"
      style="btn"
      class="btn btn-secondary btn-lg btn-block"
    >Daugiau vietų</button>
  </div>
</template>

<script>
import Place from "./Place";
export default {
  name: "Places",
  components: {
    Place
  },
  props: ["places", "hasMorePlaces"],
  methods: {
    morePlaces() {
      this.$emit("morePlaces");
    }
  }
};
</script>

<style scoped>
.row {
  background-image: linear-gradient
    (to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%);
  padding: 60px 90px;
}
</style>
