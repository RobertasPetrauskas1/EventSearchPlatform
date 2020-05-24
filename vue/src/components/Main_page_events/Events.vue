<template>
    <div class="container">
    <div class="row justify-content-center">
        <div class="card-deck">
            <Event :key="event.id" v-for="event in events" :event="event" />
        </div>
    </div>
</div> 
</template>

<script>
import Event from './Event'
export default {
    name: "Events",
    components: {
        Event
    },
    props: ["events"]
}
</script>

<style scoped>
.row {
    background-image: linear-gradient
    (to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%); 
    padding: 60px 90px;
}
</style>