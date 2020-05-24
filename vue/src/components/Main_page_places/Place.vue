<template>
  <div class="col-lg-4 col-md-6 py-2" style="margin-top: 8%">
    <div class="card shadow card-fixed-heigth">
      <router-link :to="{ name: 'Place', params: { placeId: this.place.id } }">
        <img class="card-img-top place-img" alt="Responsive image" v-bind:src="photo" />
      </router-link>
      <div class="card-body h-200 text-center">
        <router-link
          style="color: rgb(0, 0, 0)"
          :to="{ name: 'Place', params: { placeId: this.place.id } }"
        >
          <h5 id="title" class="card-title text-center my-2">{{ place.name }}</h5>
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
          {{ place.location }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
//import axios from "axios";

export default {
  name: "Place",
  props: ["place"],
  data() {
    return {
      photo: `http://localhost:8081/media/${this.place.photo}`,
    };
  },
};
</script>

<style scoped>
.col {
  min-width: 30vh;
  padding: 20px;
  border-bottom: 0px;
  margin-bottom: 0;
}
.card-title {
    font-weight: bold;
    font-size: 1.6em;
    text-align: left;
    margin: 15px 5px 0px 5px;
    overflow: hidden;
    max-height: 3.3em;
    line-height: 1.1em;
}

.date {
  color: #474747;
  text-align: left;
  font-family: sans-serif;
  padding: 0px 5px;
}

.place-img{ 
    height: 10em;
    object-fit: cover;
}

.card-fixed-heigth {
    height: 25em;
}
</style>
