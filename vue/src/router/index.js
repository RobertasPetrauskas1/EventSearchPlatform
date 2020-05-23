import Vue from "vue";
import VueRouter from "vue-router";
import Event_info from "../views/Event_info";
import SearchBar from "../views/SearchBar";
import Body from "../views/Body";
import All_places from "../views/All_places";
import Place_info from "../views/Place_info";
import Header from "../components/layout/Header";
import Footer from "../components/layout/Footer";
import New_Event from "../views/New_Event";
import Logout from "../views/Logout";

Vue.use(VueRouter);

const routes = [
  {
    path: "/logout",
    name: "logout",
    components: {
      default: Logout
    }
  },
  {
    path: "/",
    components: {
      a: Header,
      default: SearchBar,
      b: Body,
      c: Footer
    },
  },
  {
    path: "/event/:eventId",
    name: "Event",
    components: {
      a: Header,
      default: Event_info,
      b: Footer
    },
  },
  {
    path: "/place",
    components: {
      a: Header,
      default: SearchBar,
      b: All_places,
      c: Footer
    },
  },
  {
    path: "/place/:placeId",
    name: "Place",
    components: {
      a: Header,
      default: Place_info,
      b: Footer
    }
  },
  {
    path: "/newEvent",
    name: "newEvent",
    components: {
      default: New_Event,
    }
  },
  {
    path: "*",
    components: {
      a: Header,
      default: SearchBar,
      b: Body,
      c: Footer
    },
  },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

export default router;
