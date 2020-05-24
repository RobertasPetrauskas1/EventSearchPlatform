<template>
    <div v-if="isEventWorking" class="col-lg-4 col-md-6 py-2" style="margin-top: 8%">
    <div class="card shadow card-fixed-heigth">
        <router-link :to="{name: 'Event', params: {eventId: this.event.id}}">
            <img class="card-img-top event-img" alt="Responsive image" v-bind:src="photo">
        </router-link>
        <div class="card-body h-200 text-center">
                <router-link style="color: rgb(0, 0, 0)" :to="{name: 'Event', params: {eventId: this.event.id}}">
                    <h5 id="title" class="card-title text-center my-2">{{event.name}}</h5>
                </router-link>
              <p class="date text-center">
                  <svg class="bi bi-calendar" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" d="M14 0H2a2 2 0 00-2 2v12a2 2 0 002 2h12a2 2 0 002-2V2a2 2 0 00-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" clip-rule="evenodd"/>
                      <path fill-rule="evenodd" d="M6.5 7a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm-9 3a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm-9 3a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2zm3 0a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                  </svg>
                  {{event.date}}</p>        
              <p class="place text-center"> 
                  <svg class="bi bi-map" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" d="M15.817.613A.5.5 0 0116 1v13a.5.5 0 01-.402.49l-5 1a.502.502 0 01-.196 0L5.5 14.51l-4.902.98A.5.5
                       0 010 15V2a.5.5 0 01.402-.49l5-1a.5.5 0 01.196 0l4.902.98 4.902-.98a.5.5 0 01.415.103zM10 2.41l-4-.8v11.98l4 .8V2.41zm1 
                       11.98l4-.8V1.61l-4 .8v11.98zm-6-.8V1.61l-4 .8v11.98l4-.8z" clip-rule="evenodd"/>
                  </svg>
              {{place.name}}</p>        
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios';
import c from '@/const';

export default {
    name: "Event",
    props: ["event"],
    data() {
        return {
            place : null,
            photo : ``,
            isEventWorking: false
        }
    },
    methods: {
        getPlace(){
             return axios.get(`${c.serverURL}/place/${this.event.location}`)
                .then((response) => {
                    this.place = response.data;
                })
                .catch((error) => {
                    this.events = "An error occured" + error;
                });
        }
    },
    created
}

async function created(){
    await this.getPlace();

    this.isEventWorking = true;

    this.photo = `${c.serverURL}/media/${this.event.photo}`;
  }

</script>

<style scoped>
.col{ 
    min-width: 30vh; 
    padding: 20px;
    border-bottom: 0px;
    margin-bottom: 0;

}
.card-title{    
    /* font: bold 30px poppins; */
    font-weight: bold;
    font-size: 1.6em;
    text-align: left;
    margin: 15px 5px 0px 5px;
    overflow: hidden;
    max-height: 3.3em;
    line-height: 1.1em;
}

.date{
    color: #474747;
    text-align: left;
    font-family: sans-serif;  
    padding: 0px 5px;  
}

.place{
    color: grey;
    text-align: left;
    font-size: 12px;
    font-family: sans-serif;  
    padding: 0px 5px;  
}

.event-img{
    height: 10em;
    object-fit: cover;
}

.card-fixed-heigth {
    height: 25em;
}
</style>