<template>
  <div>
    <Places v-bind:places="places" />
  </div>
</template>

<script>
import Places from "../components/Main_page_places/Places";
import axios from "axios";

export default {
  name: "All_places",
  components: {
    Places,
  },
  data() {
    return {
      places: [],
    };
  },
  created() {
    axios
      .get("http://localhost:8081/place")
      .then((res) => (this.places = res.data))
      .catch((err) => console.log(err));
  },
};
</script>

<style scoped></style>
