import Vue from "vue";
import VueRouter from "vue-router";
import Event_info from "../views/Event_info";
import SearchBar from "../views/SearchBar";
import Body from "../views/Body";
import All_places from "../views/All_places";
import Place_info from "../views/Place_info";
import Search_City from "../views/Search_City";
import Search_Category from "../views/Search_Category";
import Header from "../components/layout/Header";
import Footer from "../components/layout/Footer";
import New_Event from "../views/New_Event";
import Logout from "../views/Logout";
import SearchBarP from "../views/SearchBarP";
import Search_City_P from "../views/Search_City_P";
import Search_Input from "../views/Search_Input";
import Search_Category_P from "../views/Search_Category_P";
import Search_Input_P from "../views/Search_Input_P";

Vue.use(VueRouter);

const routes = [
  {
    path: "/logout",
    name: "logout",
    components: {
      default: Logout,
    },
  },
  {
    path: "/",
    components: {
      a: Header,
      default: SearchBar,
      b: Body,
      c: Footer,
    },
  },
  {
    path: "/event/:eventId",
    name: "Event",
    components: {
      a: Header,
      default: Event_info,
      b: Footer,
    },
  },
  {
    path: "/event/search/city/:city",
    components: {
      a: Header,
      default: SearchBar,
      b: Search_City,
      c: Footer,
    },
  },
  {
    path: "/event/search/category/:event_type",
    components: {
      a: Header,
      default: SearchBar,
      b: Search_Category,
      c: Footer,
    },
  },
  {
    path: "/event/search/:input",
    name: "Search",
    components: {
      a: Header,
      default: SearchBar,
      b: Search_Input,
      c: Footer,
    },
  },
  {
    path: "/place",
    components: {
      a: Header,
      default: SearchBarP,
      b: All_places,
      c: Footer,
    },
  },
  {
    path: "/place/:placeId",
    name: "Place",
    components: {
      a: Header,
      default: Place_info,
      b: Footer,
    },
  },
  {
    path: "/place/search/city/:city",
    components: {
      a: Header,
      default: SearchBarP,
      b: Search_City_P,
      c: Footer,
    },
  },
  {
    path: "/place/search/category/:place_type",
    components: {
      a: Header,
      default: SearchBarP,
      b: Search_Category_P,
      c: Footer,
    },
  },
  {
    path: "/place/search/:input",
    name: "SearchP",
    components: {
      a: Header,
      default: SearchBarP,
      b: Search_Input_P,
      c: Footer,
    },
  },
  {
    path: "/newEvent",
    name: "newEvent",
    component: New_Event,
    meta: {
      requiresAuth: true,
    },
  },
  {
    path: "*",
    components: {
      a: Header,
      default: SearchBar,
      b: Body,
      c: Footer,
    },
  },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

export default router;
