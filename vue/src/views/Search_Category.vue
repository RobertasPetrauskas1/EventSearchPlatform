<template>
  <div>
    <Events v-bind:events="City_events" />
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
  created() {
    axios
      .get(
        `${c.serverURL}/event/search/category/${this.$route.params.event_type}`
      )
      .then(res => (this.City_events = res.data))
      .catch(err => console.log(err));
  }
};
</script>

<style scoped></style>
