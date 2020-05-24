<template>
  <div>
    <Places v-bind:places="City_places" />
  </div>
</template>

<script>
import Places from "../components/Main_page_events/Places";
import axios from "axios";
import c from "@/const";

export default {
  name: "Search_City",
  components: {
    Places
  },
  data() {
    return {
      City_places: []
    };
  },
  created() {
    axios
      .get(
        `${c.serverURL}/place/search/category/${this.$route.params.event_type}`
      )
      .then(res => (this.City_places = res.data))
      .catch(err => console.log(err));
  }
};
</script>

<style scoped></style>
