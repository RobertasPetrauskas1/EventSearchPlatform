<template>
  <div>
    <Places v-bind:places="places" />
    <button
      v-if="hasMorePlaces"
      @click="addPlaces()"
      type="button"
      class="btn btn-secondary btn-lg"
      style="btn; width:1000px; margin-bottom: 30px"
    >Daugiau vietų</button>
  </div>
</template>

<script>
import Places from "../components/Main_page_places/Places";
import axios from "axios";
import c from "@/const";

export default {
  name: "All_places",
  components: {
    Places
  },
  data() {
    return {
      places: [],
      limit: 6,
      hasMorePlaces: false,
      loaded: 0
    };
  },
  methods: {
    addPlaces(limit = 6) {
      this.loadPlaces(limit, this.loaded);
    },
    async loadPlaces(limit, offset) {
      var newPlaces = await axios
        .get(`${c.serverURL}/place?limit=${limit}&offset=${offset}`)
        .then(res => res.data)
        .catch(err => console.error(err));

      if (newPlaces.length == limit) this.hasMorePlaces = true;
      else this.hasMorePlaces = false;

      this.loaded += limit;
      this.places = this.places.concat(newPlaces);
    }
  },
  created() {
    this.addPlaces(this.limit);
  }
};
</script>

<style scoped></style>
