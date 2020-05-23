<template>
  <div>
    <Places
      v-on:morePlaces="addPlaces"
      v-bind:places="places"
      v-bind:hasMorePlaces="hasMorePlaces"
    />
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
      limit: 3,
      hasMorePlaces: false
    };
  },
  methods: {
    addPlaces() {
      this.limit += 9;
    }
  },
  async created() {
    await axios
      .get(`${c.serverURL}/place?limit=${this.limit}&offset=0`)
      .then(res => (this.places = res.data))
      .catch(err => console.log(err));

    if (this.places.length == this.limit) this.hasMorePlaces = true;
    else this.hasMorePlaces = false;
  },

  async updated() {
    await axios
      .get(`${c.serverURL}/place?limit=${this.limit}&offset=0`)
      .then(res => (this.places = res.data))
      .catch(err => console.log(err));

    if (this.places.length == this.limit) this.hasMorePlaces = true;
    else this.hasMorePlaces = false;
  }
};
</script>

<style scoped></style>
