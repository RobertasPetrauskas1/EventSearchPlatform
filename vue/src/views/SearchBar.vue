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
        >
          Visi Miestai
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="">Vilnius</a>
          <a class="dropdown-item" href="">Kaunas</a>
          <a class="dropdown-item" href="">Klaipėda</a>
          <a class="dropdown-item" href="">Šiauliai</a>
          <a class="dropdown-item" href="">Panevėžys</a>
          <a class="dropdown-item" href="">Alytus</a>
          <a class="dropdown-item" href="">Palanga</a>
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
        >
          Kategorijos
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="">Sportas</a>
          <a class="dropdown-item" href="">Koncertai</a>
          <a class="dropdown-item" href="">Festivaliai</a>
          <a class="dropdown-item" href="">Spektakliai</a>
          <a class="dropdown-item" href="">Vaikams</a>
          <a class="dropdown-item" href="">Parodos</a>
          <a class="dropdown-item" href="">Mokymai</a>
          <a class="dropdown-item" href="">Minėjimai</a>
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
