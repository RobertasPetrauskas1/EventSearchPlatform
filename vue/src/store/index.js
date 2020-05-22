import Vuex from "vuex";
import Vue from "vue";
import axios from "axios";

//Load Vuex
Vue.use(Vuex);

// Create store
export default new Vuex.Store({
  state: {
    token: localStorage.getItem("access_token") || null,
    users: [],
    currentUser: null,
  },
  getter: {},
  actions: {
    async loadUsers({ commit }) {
      const response = await axios.get("http://localhost:8081/user");

      commit("SET_USERS", response.data);

      let user = JSON.parse(window.localStorage.currentUser);
      commit("SET_CURRENT_USER", user);
    },
    logoutUser({ commit }) {
      commit("LOGOUT_USER");
    },
    loginUser({ commit }, user) {
      commit("SET_CURRENT_USER", user);
    },
    retrieveToken({ commit }, credentials) {
      axios
        .post("http://localhost:8081/access/login", {
          username: credentials.username,
          password: credentials.password,
        })
        .then((response) => {
          const token = response.data.token;

          localStorage.setItem("access_token", token);
          commit("retrieveToken", token);
          return response;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  mutations: {
    SET_USERS(state, users) {
      state.users = users;
    },
    LOGOUT_USER(state) {
      state.currentUser = {};
      window.localStorage.currentUser = JSON.stringify({});
    },
    SET_CURRENT_USER(state, user) {
      state.currentUser = user;
      window.localStorage.currentUser = JSON.stringify(user);
    },
    retrieveToken(state, token) {
      state.token = token;
    },
  },
});
