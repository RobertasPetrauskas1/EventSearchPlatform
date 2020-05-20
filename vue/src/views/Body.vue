<template>
  <div>
    <Events v-on:moreEvents="addEvents" v-bind:events="events" v-bind:hasMoreEvents="hasMoreEvents" />
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
      limit : 9,
      hasMoreEvents: false
    };
  },
  methods:{
    addEvents(){
      this.limit += 9;
    }
  },
  async created() {
    await axios
      .get(`${c.serverURL}/event?limit=${this.limit}&offset=0`)
      .then((res) => (this.events = res.data))
      .catch(err => console.log(err));

    if(this.events.length == this.limit)
        this.hasMoreEvents = true;
    else
        this.hasMoreEvents = false;
  },
  
  async updated() {
    await axios
      .get(`${c.serverURL}/event?limit=${this.limit}&offset=0`)
      .then((res) => (this.events = res.data))
      .catch(err => console.log(err));

    if(this.events.length == this.limit)
        this.hasMoreEvents = true;
    else 
        this.hasMoreEvents = false;
  }
};
</script>

<style scoped></style>
