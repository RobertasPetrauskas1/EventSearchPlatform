import Vuex from "vuex";
import Vue from "vue";
import axios from "axios";

//Load Vuex
Vue.use(Vuex);

// Create store
export default new Vuex.Store({
  state: {
    token: sessionStorage.getItem("access_token") || null,
    error: null
  },
  getters: {
    isLoggedIn: state => state.token != null,
    isError: state => state.error != null
  },
  actions: {
    retrieveToken({ commit }, credentials) {
      axios
        .post("http://localhost:8081/access/login", {
          username: credentials.username,
          password: credentials.password,
        })
        .then((response) => {
          const token = response.data.token;

          sessionStorage.setItem("access_token", token);
          commit("retrieveToken", token);
          return response;
        })
        .catch((error) => {
          this.state.error = error.response.data.error;
          console.log(error.response.data.error);
          console.log(error);
        });
    },
    destroyToken(context){
      if(context.getters.isLoggedIn){
         axios
        .post("http://localhost:8081/access/logout", this.state.token, {
          headers: {
            'Content-Type' : 'text/plain'
          }
        })
        .then((response) => {
          console.log(response.data);
          sessionStorage.removeItem("access_token");
          context.commit("destroyToken");
          return response;
        })
        .catch((error) => {
          sessionStorage.removeItem("access_token");
          context.commit("destroyToken");
          console.log(error);
        });
      }
    },
    createToken(context, credentials){
      axios
        .post("http://localhost:8081/access/register", {
          user_name: credentials.username,
          email: credentials.email,
          password: credentials.password
        })
        .then((response) => {
          const token = response.data.token;

          sessionStorage.setItem("access_token", token);
          context.commit("retrieveToken", token);
          return response;
        })
        .catch((err) => {
          this.state.error = err.response.data.errors[0];
          console.log(err);
        });
    },
    clearError(context){
      context.commit('clearError');
    }
  },
  mutations: {
    retrieveToken(state, token) {
      state.token = token;
    },
    destroyToken(state){
      state.token = null;
    },
    clearError(state){
      state.error = null;
    }
  },
});
