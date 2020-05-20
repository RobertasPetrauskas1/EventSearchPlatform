import Vue from "vue";
import VueRouter from "vue-router";
import Event_info from "../views/Event_info";
import SearchBar from "../views/SearchBar";
import Body from "../views/Body";
import All_places from "../views/All_places";
import Place_info from "../views/Place_info";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    components: {
      default: SearchBar,
      a: Body,
    },
  },
  {
    path: "/event/:eventId",
    name: "Event",
    component: Event_info,
  },
  {
    path: "/place",
    components: {
      default: SearchBar,
      a: All_places,
    },
  },
  {
    path: "/place/:placeId",
    name: "Place",
    component: Place_info,
  },
  {
    path: "*",
    components: {
      default: SearchBar,
      a: Body,
    },
  },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

export default router;
