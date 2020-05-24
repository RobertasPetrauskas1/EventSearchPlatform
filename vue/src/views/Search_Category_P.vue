<template>
  <div>
    <Places v-bind:places="City_places" />
  </div>
</template>

<script>
import Places from "../components/Main_page_places/Places";
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
  methods: {
    readCityInfo() {
      axios
        .get(
          `${c.serverURL}/place/search/category/${this.$route.params.place_type}`
        )
        .then(res => (this.City_places = res.data))
        .catch(err => console.log(err));
    }
  },
  watch: {
    $route() {
      this.readCityInfo();
    }
  },
  async created() {
    await this.readCityInfo();
  }
};
</script>

<style scoped></style>
