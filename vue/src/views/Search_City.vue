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
      City_events: [],
      limit: 3,
      hasMoreEvents: false,
      loaded: 0
    };
  },
  methods: {
    addEvents(limit = 6) {
      this.loadEvents(limit, this.loaded);
    },
    async loadEvents(limit, offset) {
      var newEvents = await axios
        .get(
          `${c.serverURL}/event/search/city/${this.$route.params.city}?limit=${limit}&offset=${offset}`
        )
        .then(res => res.data)
        .catch(err => console.log(err));

      if (newEvents.length == limit) this.hasMoreEvents = true;
      else this.hasMoreEvents = false;

      this.loaded += limit;
      this.City_events = this.City_events.concat(newEvents);
    }
  },
  watch: {
    $route() {
      this.City_events = [];
      this.loaded = 0;
      this.addEvents();
    }
  },
  created() {
    this.addEvents();
  }
};
</script>

<style scoped>
.customButton {
  width: 1000px;
  margin-bottom: 30px;
}
</style>
