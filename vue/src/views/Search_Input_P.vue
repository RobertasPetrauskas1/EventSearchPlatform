<template>
  <div>
    <Places v-bind:places="input_Results" />
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
      input_Results: []
    };
  },
  methods: {
    readInputResults() {
      axios
        .get(`${c.serverURL}/place/search/${this.$route.params.input}`)
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