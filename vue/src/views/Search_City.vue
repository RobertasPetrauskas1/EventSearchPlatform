<template>
  <div>
    <Events v-bind:events="City_events" />
    <button
      v-if="hasMoreEvents"
      @click="addEvents()"
      type="button"
      class="btn btn-secondary btn-lg customButton"
    >Daugiau renginių</button>
  </div>
</template>

<script>
import Events from "../components/Main_page_events/Events";
import axios from "axios";
import c from "@/const";

export default {
  name: "Search_City",
  components: {
    Events
  },
  data() {
    return {
      City_events: []
    };
  },
  methods: {
    readCityInfo() {
      axios
        .get(`${c.serverURL}/event/search/city/${this.$route.params.city}`)
        .then(res => (this.City_events = res.data))
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
