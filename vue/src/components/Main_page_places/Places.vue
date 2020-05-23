<template>
  <div class="container" style="max-width: 1300px">
    <div class="row justify-content-center">
      <div class="card-deck">
        <div v-bind:key="place.id" v-for="place in places">
          <Place v-bind:place="place" />
        </div>
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
  min-height: 100vh;
  padding: 60px 90px;
}
.card {
  min-height: 690px;
}
.btn {
  background-color: #d3d3d3;
  margin-bottom: 15px;
}
</style>
