<template>
    <div v-if="isEventWorking" class="container">

        <img alt="event_image" class="event_pic" v-bind:src="test">
        <!-- renginio pavadinimas -->
        <div class="heading">
            <span class="event_name">{{eventInfo.name}}</span>
        </div>
        <!-- renginio aprasymas -->
        <div class="about_event">
            <!--vietos ikona ir info-->

                <img src="../assets/time.png" alt="time_icon" class="image_ex">
                <span class="date">{{eventInfo.date}} </span>
                <span class="time"> {{eventInfo.time}}</span>
                <p></p>
            <!--telefono ikona ir info-->

                <img src="../assets/smartphone.png" alt="phone_icon" class="image_ex">
                <span class="phone">{{eventInfo.phone_number}}</span>
                <p></p>
            <!--tipo ikona ir info-->

                <img src="../assets/folder.png" alt="type_icon" class="image_ex">
                <span class="type">{{eventInfo.fk_event_type}}</span>
                <p></p>
            <!--vietos ikona ir info-->

                <img src="../assets/pin.png" alt="place_icon" class="image_ex"> 
                <span  class="place">{{placeInfo.name}}</span>
                <p></p>
            <!--puslapio ikona ir info-->

                <img src="../assets/internet.png" alt="page_icon" class="image_ex">
                <span class="page">{{eventInfo.tickets}}</span>
                <p></p>

        </div>
        <!--social media-->
        <div class="social_m">
            <img src="../assets/facebook.png" alt="facebook_icon" class="social">
            <img src="../assets/google-plus.png" alt="google_icon" class="social">
            <img src="../assets/twitter.png" alt="twitter_icon" class="social">
        </div>
        <!--tekstas apie rengini-->
        <div class="main_text">
            <p><b>Aprašas:</b> {{this.eventInfo.description}}</p>
        </div>

    </div>
</template>

<script>
import axios from 'axios'
import c from '@/const'

export default {
    name: 'Event_info',
    data() {
        return {
            eventInfo: null,
            test: null,
            placeInfo: null,
            isEventWorking: false
        };
    },
    methods: {
        getEvent(){
             return axios.get(`${c.serverURL}/event/${this.$route.params.eventId}`)
                .then((response) => {
                    this.eventInfo = response.data;
                    this.isEventWorking = true;
                })
                .catch((error) => {
                    this.eventInfo = "An error occured" + error;
                });
        },
        getPlace(){
            return axios.get(`${c.serverURL}/place/${this.eventInfo.fk_place}`)
                .then((response) => {
                    this.placeInfo = response.data;
                    this.isPlaceWorking = true;
                })
                .catch((error) => {
                    this.placeInfo = "An error occured" + error
                });
        }
    },
    async created(){
        await this.getEvent();

        this.test = `${c.serverURL}/media/${this.eventInfo.fk_photo}`;

        await this.getPlace();
    }
}
</script>

<style scoped>
.container{
    max-width: 885px;
    margin: auto;

}
.event_pic{
    padding-bottom: 0%;
    display: block;
}
.event_name{
    color: white;
    font-size: 30px;
    font-weight: bold;

}
.heading{
    background-color: black;
    padding: 10px;
    text-align: center;
    margin-bottom: 10px;
    width: 885px;
}
.about_event{
    font-size: 25px;
    text-align: center;
    font-weight: bolder;
    border-top: 2px solid black;
    border-bottom: 2px solid black;
    padding-top: 5px;
    padding-bottom: 0px;
    width: 885px;
}
.image_ex{
    width: 3%;
    height: auto;
}
.social_m{
    margin-top: 10px;
    text-align: center; 
    border-bottom: 2px solid black; 

}
.social{
    margin: 20px;
}

.main_text{
    font-size: 25px;
    margin-bottom: 100px;
}
</style>