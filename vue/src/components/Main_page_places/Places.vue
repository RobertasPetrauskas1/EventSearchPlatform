<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="card-deck">
        <Place :key="place.id" v-for="place in places" v-bind:place="place" />
      </div>
    </div>
    <div class="alert" v-if="IsEmpty">Vietų nėra</div>
  </div>
</template>

<script>
import Place from "./Place";
export default {
  name: "Places",
  components: {
    Place
  },
  props: ["places"],
  computed: {
    IsEmpty() {
      return this.places.length == 0;
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
.alert {
  background-image: linear-gradient
    (to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%);
  padding: 10% 90px 15%;
  font-size: 200%;
}
</style>
