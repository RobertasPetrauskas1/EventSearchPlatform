<template>
  <div>
    <Events :events="events" />
    <button v-if="hasMoreEvents" @click="addEvents()" type="button" class="btn btn-secondary btn-lg" style="btn; width:1000px; margin-bottom: 30px">Daugiau renginių</button>
  </div>
</template>

<script>
import Events from "../components/Main_page_events/Events";
import axios from "axios";
import c from "@/const";

export default {
  name: "Body",
  components: {
    Events
  },
  data() {
    return {
      events: [],
      limit: 3,
      hasMoreEvents: false,
      loaded: 0
    };
  },
  methods:{
    addEvents(limit = 6){
      this.loadEvents(limit, this.loaded);
    },
    async loadEvents(limit, offset){
      var newEvents = await axios
        .get(`${c.serverURL}/event?limit=${limit}&offset=${offset}`)
        .then((res) => res.data)
        .catch(err => console.error(err));

      if(newEvents.length == limit)
          this.hasMoreEvents = true;
      else
          this.hasMoreEvents = false;

      this.loaded += limit;
      this.events = this.events.concat(newEvents);
    }
  },
  created() {
     this.addEvents(this.limit);
  },
};
</script>

<style scoped></style>
