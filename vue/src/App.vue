<template>
  <div id="app">
    <router-view name="a" />
    <br><br><br>
    <router-view />
    <router-view name="b" />
    <router-view name="c" />
  </div>
</template>

<script>
export default {
  name: 'app',
  components: {
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
