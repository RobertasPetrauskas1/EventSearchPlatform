<template>
 <div>
       <Events v-bind:events="events" />
 </div>
</template>

<script>
import Events from '../components/Main_page_events/Events'
import axios from 'axios';

export default {
    name: 'Body',
    components: {
        Events
    },
    data() {
        return {
            events: []
        }
    },
    created() {
        axios.get('http://localhost:8081/event')
            .then(res => this.events = res.data)
            .catch(err => console.log(err));
    }
}   
</script>

<style scoped>

</style>