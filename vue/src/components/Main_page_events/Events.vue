<template>
    <div class="container" style="max-width: 1300px">
    <div class="row justify-content-center" style="min-height: 50vh">
        <div class="card-deck">
            <div v-bind:key="event.id" v-for="event in events">
                <Event v-bind:event="event" />
            </div>
        </div>
    </div>
    <button v-if="hasMoreEvents" @click="moreEvents" type="button" style="btn" class="btn btn-secondary btn-lg btn-block">Daugiau renginių</button>
</div> 
</template>

<script>
import Event from './Event'
export default {
    name: "Events",
    components: {
        Event
    },
    props: ["events", "hasMoreEvents"],
    methods: {
        moreEvents(){
            this.$emit('moreEvents');
        }
    }
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