<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="card-deck">
        <Event :key="event.id" v-for="event in events" :event="event" />
      </div>
    </div>
    <div class="alert" v-if="IsEmpty">Renginių nėra</div>
  </div>
</template>

<script>
import Event from "./Event";
export default {
  name: "Events",
  components: {
    Event
  },
  props: ["events"],
  computed: {
    IsEmpty() {
      return this.events.length == 0;
    }
  }
};
</script>

<style scoped>
.row {
  background-image: linear-gradient
    (to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%);
  padding: 60px 90px;
}
.alert {
  background-image: linear-gradient
    (to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%);
  padding: 10% 90px 15%;
  font-size: 200%;
}
</style>