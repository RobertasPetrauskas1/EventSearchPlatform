<template>
  <div id="app">
    <Header />
    <br><br><br>
    <SearchBar />
    <router-view/>
    <Footer />
  </div>
</template>

<script>
import Header from './components/layout/Header';
import Footer from './components/layout/Footer';
import SearchBar from './components/SearchBar';
export default {
  name: 'app',
  components: {
    Header,
    Footer,
    SearchBar,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.bg-modal {
     width: 100%;
     height: 100%;
     background-color: black;
     opacity: 0.7;
     position: absolute;
     top: 0;
   }
</style>
