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
          <router-link to="/event/search/city/Vilnius" class="dropdown-item">Vilnius</router-link>
          <router-link to="/event/search/city/Kaunas" class="dropdown-item">Kaunas</router-link>
          <router-link to="/event/search/city/Klaipėda" class="dropdown-item">Klaipėda</router-link>
          <router-link to="/event/search/city/Šiauliai" class="dropdown-item">Šiauliai</router-link>
          <router-link to="/event/search/city/Panevėžys" class="dropdown-item">Panevėžys</router-link>
          <router-link to="/event/search/city/Alytus" class="dropdown-item">Alytus</router-link>
          <router-link to="/event/search/city/Palanga" class="dropdown-item">Palanga</router-link>
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
          <router-link to="/event/search/category/Sportas" class="dropdown-item" href>Sportas</router-link>
          <router-link to="/event/search/category/Koncertai" class="dropdown-item" href>Koncertai</router-link>
          <router-link
            to="/event/search/category/Festivaliai"
            class="dropdown-item"
            href
          >Festivaliai</router-link>
          <router-link
            to="/event/search/category/Spektakliai"
            class="dropdown-item"
            href
          >Spektakliai</router-link>
          <router-link to="/event/search/category/Vaikams" class="dropdown-item" href>Vaikams</router-link>
          <router-link to="/event/search/category/Parodos" class="dropdown-item" href>Parodos</router-link>
          <router-link to="/event/search/category/Mokymai" class="dropdown-item" href>Mokymai</router-link>
          <router-link to="/event/search/category/Minėjimai" class="dropdown-item" href>Minėjimai</router-link>
        </div>
      </div>
      <form>
        <input
          id="searchBar"
          type="text"
          v-model="search"
          name="searchBar"
          placeholder="What are you looking for..."
        />
        <button id="submitSearch" type="submit" name="submit" alt="Submit">
          <img src="../assets/search.png" height="40px" />
        </button>
      </form>
    </div>
  </div>
</template>

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
