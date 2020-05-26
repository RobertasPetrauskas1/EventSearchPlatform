<template>
  <div>
    <Events v-bind:events="input_Results" />
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
  name: "Search_Input",
  components: {
    Events
  },
  data() {
    return {
      input_Results: [],
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
          `${c.serverURL}/event/search/${this.$route.params.input}?limit=${limit}&offset=${offset}`
        )
        .then(res => res.data)
        .catch(err => console.log(err));
      if (newEvents.length == limit) this.hasMoreEvents = true;
      else this.hasMoreEvents = false;

      this.loaded += limit;
      this.input_Results = this.input_Results.concat(newEvents);
    }
  },
  watch: {
    $route() {
      this.input_Results = [];
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