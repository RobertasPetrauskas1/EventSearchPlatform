<template>
<div>
    
    <div class="container">
     <div class="row justify-content-center">
      <div class="col-12">
       <h1 class="text-center py-3">Renginio įkėlimo forma</h1>
      </div>
      <div class="col-md-10">
       <div class="indicators d-flex justify-content-around py-4 text-light">
        <div class="rounded-circle bg-secondary px-2 shadow-sm mr-2" :class="getIndicatorClass(1)">1</div>
        <div class="rounded-circle bg-secondary px-2 shadow-sm mr-2" :class="getIndicatorClass(2)">2</div>
        <div class="rounded-circle bg-secondary px-2 shadow-sm mr-2" :class="getIndicatorClass(3)" >3</div>
        <div class="rounded-circle bg-secondary px-2 shadow-sm mr-2" :class="getIndicatorClass(4)">4</div>
        <div class="rounded-circle bg-secondary px-2 shadow-sm" :class="getIndicatorClass(5)">5</div>

       </div>
      </div>
      <div class="col-md-8">
       <div class="fix-height position-relative">
        <div class="row justify-content-center"></div>
        <div class="steps" :class="getStepClass(1)">
            <div class="form-group">
                <label for="sel1">Renginio kategorija</label>
                <v-select :options="kategorijos" :reduce="cat => cat.singular" label="singular" id="sel1" v-model="eventCat" :class="{invalid: !isValid('eventCat')}"/>
              </div>
         </div>
        </div>
        <div class="steps" :class="getStepClass(2)">
         <div class="form-group">
          <label for="inp2">Renginio pavadinimas</label>
          <input type="text" id="inp2" class="form-control" v-model="eventName" :class="{invalid: !isValid('eventName')}">
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Renginio aprašymas</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="eventDes" :class="{invalid: !isValid('eventDes')}"></textarea>
          </div>
         </div>
        </div>
        <div class="steps" :class="getStepClass(3)">
         <div class="form-group">
            <div class="form-group">
              <!-- Nuotrauka -->
              <label for="exampleFormControlFile1">Pasirinkite renginio nuotrauka</label>
              <input type="file" class="form-control-file" id="exampleFormControlFile1" name="img" @change="selectedFile" multiple>
            </div>
          
         </div>
        </div>
        <div class="steps" :class="getStepClass(4)">
         <div class="form-group">
          <label for="inp4">Telefono numeris</label>
          <input type="text" id="inp4" class="form-control" v-model="phoneNumb" :class="{invalid: !isValid('phoneNumb')}">
          <label for="inp5">Facebook nuoroda</label>
          <input type="text" id="inp5" class="form-control" v-model="webSite" :class="{invalid: !isValid('webSite')}">
          <label for="inp6">Puslapio nuoroda</label>
          <input type="text" id="inp6" class="form-control" v-model="pageLink" :class="{invalid: !isValid('pageLink')}">
         </div>
        </div>
        <div class="steps" :class="getStepClass(5)">
            <div class="form-group">
                <label for="exampleFormControlSelect1">Renginio vieta</label>
                <v-select :options="places" :reduce="p => p.id" label="name" id="exampleFormControlSelect1" v-model="eventPlace" :class="{invalid: !isValid('eventPlace')}"/>
            </div>

            <label >Renginio data ir laikas</label>
            <div class="form-group row">
                <div class="col-10">
                  <input class="form-control" type="date"  id="example-date-input" v-model="eventDate" :class="{invalid: !isValid('eventDate')}">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-10">
                  <input class="form-control" type="time"  id="example-time-input" v-model="eventTime" :class="{invalid: !isValid('eventTime')}">
                </div>
              </div>
        </div>
       </div>
      </div>
      <div class="col-md text-center">
       <button type="button" class="btnPrev btn btn-outline-success" @click="prevPage" v-show="pageNumber > 1">Atgal</button>
       <button type="button" class="btnNext btn btn-outline-success" @click="nextPage" v-show="maxPageNumber > pageNumber">Toliau</button>
       <button @click="createEvent" type="button" class="btnNext btn btn-success" v-show="maxPageNumber == pageNumber">Išsaugoti</button>
      </div>
     </div>
   
</div>
</template>


<script>
import axios from "axios";
import c from "@/const";
import vSelect from 'vue-select';
import 'vue-select/dist/vue-select.css';
import { mapState } from 'vuex';

let AllFields = {
  eventCat: {
    validate: () => true,
    page: 1
  },
  eventName:{
    validate: () => true,
    page: 2
  },
  eventDes:{
    validate: () => true,
    page: 2
  },
  //nuotraukos truksta
  phoneNumb:{
    validate: () => true,
    page: 4
  },
  webSite:{
    validate: () => true,
    page: 4
  },
  pageLink:{
    validate: () => true,
    page: 4
  },
  eventPlace:{
    validate: () => true,
    page: 5
  },
  eventDate:{
    validate: () => true,
    page: 5
  },
  eventTime:{
    validate: () => true,
    page: 5
  },

}

export default {
  name: "New_Event",
  components: {
    vSelect
  },
  data(){
    return {
      eventCat:"-----",
      eventName:"",
      eventDes:"",
      //nuotraukos truksta
      phoneNumb:"",
      webSite:"",
      pageLink:"",
      eventPlace:"-------",
      eventDate:"",
      eventTime:"",
      pageNumber:1,
      maxPageNumber:5,
      validatedPages:[],
      kategorijos: [],
      places: [],
      photoID: 0
    }
  },
  methods:{
    getIndicatorClass(i){
      if(this.pageNumber == i ){
        return "bg-warning"
      }
      if(this.pageNumber > i){
        return "bg-success"
      }
    },
    getStepClass(i){
       if(this.pageNumber == i ){
         return "active"
       }
    },
    nextPage(){
      if(this.maxPageNumber <= this.pageNumber){
        return
      }
      if(!this.validate(this.pageNumber)) {
        return
      }

      this.pageNumber++;
    },
    prevPage(){
      if(this.pageNumber <= 1){
        return
      }
      this.pageNumber--;
    },
    isValid(name){
      if(!(AllFields[name].page in this.validatedPages)){
        return true
      }
      return this.validateField(name);
    },
    validate(page) {
      const fields = Object.entries(AllFields).filter(([, conf]) => conf.page == page).map(([f]) => f)
      let valid = true
      for (const field of fields) {
        valid = valid && this.validateField(field)
      }
      if(!(page in this.validatedPages)) {
        this.validatedPages.push(page)
      }
      return valid
    },
    validateField(name) {
      let value = this[name]
      if(name == "eventPlace") {
        // Ar teisingas place
      }
      // debugger;
      if(!AllFields[name].validate()) {
        return false;
      }
      if(value) {
        return true;
      }
      return false;
    },
    readCategoryTypes() {
      axios
        .get(`${c.serverURL}/utils/eventTypes`)
        .then(res => {this.kategorijos = res.data})
        .catch(err => console.error(err));
    },
    readPlaceTypes() {
      axios.get(`${c.serverURL}/place/allNames`)
        .then((res) => {this.places = res.data})
        .catch((err) => {console.error(err)});
    },
    createEvent(){
      axios.post(`${c.serverURL}/event`, {
        fk_user_id: 1,
        name: this.eventName,
        fk_event_type: this.eventCat,
        date: this.eventDate,
        time: this.eventTime,
        duration: '4h',
        fk_city: 'Kaunas',
        fk_place: this.eventPlace,
        phone_number: this.phoneNumb,
        website: this.pageLink,
        facebook: this.webSite,
        description: this.eventDes,
        tickets: null,
        fk_photo: this.photoID
      }, {
        headers: {
          'Authorization': 'Bearer ' + this.token
        }
      })
        .then((res) => {this.places = res.data})
        .catch((err) => {console.log(err)});

        this.$router.push('/');
    },
    async selectedFile(event) {
      event.preventDefault();
      let file = event.target.files[0];

      let formData = new FormData();
      formData.append('img', file);

      this.photoID = await axios.post(`${c.serverURL}/media/upload`, formData, {
        headers: {
          'Authorization': 'Bearer ' + this.token
        }
      })
        .then((response) => {
          return response.data;
        })
        .catch((error) =>{
          console.log(error.response);
      });

      console.log(this.photoID);
    }
  },
  computed:mapState(['token']),
  created() {
    this.readCategoryTypes();
    this.readPlaceTypes();
  }
}

</script>



<style scoped>
body{
    background-color: var(--light);
   }
   
   .indicators * {
    transition: all 0.4s ease-in-out;
   }
   
   .fix-height {
    min-height: 200px;
   }
   
   .steps {
    position: absolute;
    width: 0;
    height: 100%;
    top: 0;
    left: 0;
    z-index: -1;
    visibility: hidden;
    opacity: 0;
    transition: all 0.4s ease-in-out;
   }
   
   .steps.active {
    width: 100%;
    z-index: 1;
    visibility: visible;
    opacity: 1;
    transition: all 0.4s ease-in-out;
   }
   

   
   .form-control.invalid {
    border: 1px solid #ec2626;

    animation: shaking 0.82s cubic-bezier(0.36, 0.07, 0.19, 0.97) both;
    transform: translate3d(0, 0, 0);
    backface-visibility: hidden;
    perspective: 1000px;
    transition: all 0.4s ease-in-out;
   }
   
   @keyframes shaking {
    10%,
    90% {
     transform: translate3d(-2px, 0, 0);
    }
    20%,
    80% {
     transform: translate3d(4px, 0, 0);
    }
    30%,
    50%,
    70% {
     transform: translate3d(-8px, 0, 0);
    }
    40%,
    60% {
     transform: translate3d(8px, 0, 0);
    }
   }
   
   .hidden {
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transition: all 0.4s ease-in-out;
   }
   
   .show {
    opacity: 1;
    visibility: visible;
    pointer-events: auto;
    transition: all 0.4s ease-in-out;
   }
   
   @media screen and (min-width: 768px) {
    .fix-height {
     min-height: 100px;
    }

    .col-md{
        margin-top: 130px
    }
   }
  
</style>
