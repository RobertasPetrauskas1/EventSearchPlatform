<template>
  <div class="container" style="max-width: 1300px">
    <div class="row justify-content-center" style="min-height: 50vh">
      <div class="card-deck">
        <div v-bind:key="place.id" v-for="place in places">
          <Place v-bind:place="place" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Place from "./Place";
export default {
  name: "Places",
  components: {
    Place,
  },
  props: ["places"],
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
</style>
