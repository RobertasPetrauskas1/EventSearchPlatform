<template>
    <div class="container" style="max-width: 1300px">
    <div class="row justify-content-center" style="min-height: 50vh">
        <div class="card-deck">
            <div :key="event.id" v-for="event in events">
                <Event :event="event" />
            </div>
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
    min-height: 100vh;      
    padding: 60px 90px;
}
.card {
    min-height: 690px;
}
.btn {
    background-color: #D3D3D3;
    margin-bottom: 15px;
}
</style>