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

                <a v-if="tickets" :href="tickets" class="button">PIRKTI BILIETUS</a>
                <a v-else class="button">KAINA NEPASKELBTA</a>
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
            isEventWorking: false,
            tickets : null
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

        this.tickets = this.eventInfo.tickets
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

.button {
	box-shadow: 0px 10px 14px -7px #3e7327;
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	background-color:#77b55a;
	border-radius:9px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:18px 76px;
	text-decoration:none;
	text-shadow:0px 2px 27px #5b8a3c;
}
.button:hover {
	background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
	background-color:#72b352;
}
.button:active {
	position:relative;
	top:1px;
}



</style>