<template>
  <div v-if="isPlaceWorking" class="col-sm-4 py-2" style="margin-top: 8%">
    <div class="card shadow" style="width: 19rem; height:400px">
      <router-link :to="{ name: 'Place', params: { placeId: this.place.id } }">
        <img class="card-img-top" alt="Responsive image" v-bind:src="photo" />
      </router-link>
      <div class="card-body h-200 text-center">
        <router-link
          style="color: rgb(0, 0, 0)"
          :to="{ name: 'Place', params: { placeId: this.place.id } }"
        >
          <h5 id="title" class="card-title text-center">{{ place.name }}</h5>
        </router-link>
        <p class="date text-center">
          <svg
            class="bi bi-geo-alt"
            width="1em"
            height="1em"
            viewBox="0 0 16 16"
            fill="currentColor"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fill-rule="evenodd"
              d="M8 16s6-5.686 6-10A6 6 0 002 6c0 4.314 6 10 6 10zm0-7a3 3 0 100-6 3 3 0 000 6z"
              clip-rule="evenodd"
            />
          </svg>
          {{ place.address }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
//import axios from "axios";
import c from "@/const";

export default {
  name: "Place",
  props: ["place"],
  data() {
    return {
      photo: ``,
      isPlaceWorking: false
    };
  },
  created
};

function created() {
  this.isPlaceWorking = true;

  this.photo = `${c.serverURL}/media/${this.place.fk_photo}`;
}
</script>

<style scoped>
.col {
  min-width: 30vh;
  padding: 20px;
  border-bottom: 0px;
  margin-bottom: 0;
}
.card-title {
  font: bold 30px poppins;
  text-align: left;
  padding: 15px 5px 0px 5px;
}

.date {
  color: #474747;
  text-align: left;
  font-family: sans-serif;
  padding: 0px 5px;
}
</style>
