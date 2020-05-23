import Vue from "vue";
import VueRouter from "vue-router";
import Event_info from "../views/Event_info";
import SearchBar from "../views/SearchBar";
import Body from "../views/Body";
import All_places from "../views/All_places";
import Place_info from "../views/Place_info";
import Search_City from "../views/Search_City";
import Search_Category from "../views/Search_Category";

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
    path: "/event/search/city/:city",
    components: {
      default: SearchBar,
      a: Search_City,
    },
  },
  {
    path: "/event/search/category/:event_type",
    components: {
      default: SearchBar,
      a: Search_Category,
    },
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
