<template>
  <div>
    <div id="filter" class="filter-bar">
      <div class="filter-dropdown dropdown-city dropdown">
        <button
          class="dropdown-toggle myBtn"
          type="button"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >Visi Miestai</button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <router-link
            :to="'/place/search/city/'+ miestas.name"
            class="dropdown-item"
            v-for="miestas in miestai"
            :key="miestas.name"
          >{{miestas.name}}</router-link>
        </div>
      </div>
      <div class="filter-dropdown dropdown-category dropdown">
        <button
          class="dropdown-toggle myBtn"
          type="button"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >Kategorijos</button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <router-link
            :to="'/place/search/category/'+kategorija.singular"
            class="dropdown-item"
            v-for="kategorija in kategorijos"
            :key="kategorija.name"
          >{{kategorija.name}}</router-link>
        </div>
      </div>
      <input
        @keyup.enter="loadSearch"
        id="searchBar"
        style="height: 59px"
        v-model="search"
        placeholder="Ko ieškosite..."
      />
      <span @click="loadSearch" id="submitSearch">
        <img src="../assets/search.png" height="40px" style="margin-top: 8px" />
      </span>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import c from "@/const";

export default {
  name: "SearchBar",
  data() {
    return {
      kategorijos: null,
      miestai: null,
      search: ""
    };
  },
  methods: {
    readCategoryTypes() {
      axios
        .get(`${c.serverURL}/utils/placeTypes`)
        .then(res => (this.kategorijos = res.data))
        .catch(err => console.log(err));
    },
    readAllCities() {
      axios
        .get(`${c.serverURL}/utils/cities`)
        .then(res => (this.miestai = res.data))
        .catch(err => console.log(err));
    },
    loadSearch() {
      this.$router.push({ path: `/place/search/${this.search}`, query: {} });
    }
  },
  watch: {
    $route(to) {
      if (to.name == "SearchP") {
        if (this.search != to.params.input) {
          this.search = to.params.input;
        }
      } else {
        this.search = "";
      }
    }
  },

  async created() {
    await this.readCategoryTypes();
    await this.readAllCities();
  }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.filter-bar {
  background: #f5f5f5;
  display: inline-flex;
}
.filter-bar ul {
  list-style-type: none;
}
.filter-bar li {
  margin: 0;
  display: none;
}
.filter-dropdown {
  border-right: 1px solid rgba(0, 0, 0, 0.2);
  /* padding: 15px 25px; */
  margin: 0;
  text-align: center;
}
#searchBar {
  border: none;
  background: #f5f5f5;
  padding: 10px 10px;
  border-right: 1px solid rgba(0, 0, 0, 0.2);
  width: 350px;
  height: 100%;
}
#submitSearch {
  height: 100%;
  width: 100px;
  border: none;
  background: none;
}
.myBtn {
  height: 100%;
  width: 100%;
  background: transparent;
  color: rgba(0, 0, 0, 0.6);
  border: none;
}
.myBtn:hover {
  background: transparent;
  color: rgba(0, 0, 0, 0.6);
  border: none;
}
.myBtn:active {
  background: transparent;
  color: rgba(0, 0, 0, 0.6);
  border: none;
}
.dropdown-city {
  width: 160px;
  height: 60px;
}
.dropdown-category {
  width: 160px;
  height: 60px;
}
</style>