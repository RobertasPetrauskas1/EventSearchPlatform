<template>
  <div>
    <Places v-bind:places="input_Results" />
    <button
      v-if="hasMorePlaces"
      @click="addPlaces()"
      type="button"
      class="btn btn-secondary btn-lg customButton"
    >Daugiau vietų</button>
  </div>
</template>

<script>
import Places from "../components/Main_page_places/Places";
import axios from "axios";
import c from "@/const";

export default {
  name: "Search_Input",
  components: {
    Places
  },
  data() {
    return {
      input_Results: [],
      limit: 3,
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
        .get(
          `${c.serverURL}/place/search/${this.$route.params.input}?limit=${limit}&offset=${offset}`
        )
        .then(res => res.data)
        .catch(err => console.log(err));

      if (newPlaces.length == limit) this.hasMorePlaces = true;
      else this.hasMorePlaces = false;

      this.loaded += limit;
      this.input_Results = this.input_Results.concat(newPlaces);
    }
  },
  watch: {
    $route() {
      this.input_Results = [];
      this.loaded = 0;
      this.addPlaces();
    }
  },
  created() {
    this.addPlaces();
  }
};
</script>

<style scoped>
.customButton {
  width: 1000px;
  margin-bottom: 30px;
}
</style>