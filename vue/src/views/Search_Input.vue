<template>
  <div>
    <Events v-bind:events="input_Results" />
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
      input_Results: []
    };
  },
  methods: {
    readInputResults() {
      axios
        .get(`${c.serverURL}/event/search/${this.$route.params.input}`)
        .then(res => (this.input_Results = res.data))
        .catch(err => console.log(err));
    }
  },
  watch: {
    $route() {
      this.readInputResults();
    }
  },
  async created() {
    await this.readInputResults();
  }
};
</script>

<style scoped></style>