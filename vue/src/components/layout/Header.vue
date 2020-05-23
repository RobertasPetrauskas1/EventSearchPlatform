<template>
  <div>
    <nav
      class="navbar navbar-expand-lg navbar-light sticky-top"
      style="background-color: #D3D3D3;"
    >
      <div class="container" style="max-width: 1100px;">
        <router-link to="/" class="navbar-brand">
          <img
            src="../../assets/logo.png"
            width="30"
            height="30"
            class="d-inline-block align-top"
            alt="logo"
          />
          <span>We</span>Go
        </router-link>

        <button
          class="navbar-toggler"
          data-toggle="collapse"
          data-target="#CollapseMenu"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="CollapseMenu">
          <ul class="navbar-nav ml-auto">
            <router-link to="/" class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" class="btn btn-outline-success">
                  Renginiai
                </button>
              </a>
            </router-link>
            <router-link to="/place" class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" class="btn btn-outline-info">
                  Vietos
                </button>
              </a>
            </router-link>
            <router-link v-if="isLoggedIn" to="/newEvent" class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" style="margin-right: 0px"  class="btn btn-warning postBtn">
                  Paskelbk renginį
                </button>
              </a>
            </router-link>
            <router-link v-if="isLoggedIn" to="/logout" class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" style="margin-right: 0px"  class="btn btn-dark">
                  Atsijungti
                </button>
              </a>
            </router-link>
            <div v-else class="dropdown">
              <li class="nav-item ml-auto">
                <a
                  href="#"
                  class="nav-link dropdown-toggle"
                  data-toggle="dropdown"
                  data-target="dropdown_menu"
                >
                  <img src="../../assets/login.png" width="30" height="30" />
                </a>
                <div
                  class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="dropdown_menu"
                >
                  <a
                    class="dropdown-item"
                    data-toggle="modal"
                    data-target="#loginModal"
                    >Log in</a
                  >
                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    data-toggle="modal"
                    data-target="#registrationModal"
                    >Sign up</a
                  >
                </div>
              </li>
            </div>
          </ul>
        </div>
      </div>
    </nav>

    <div class="modal fade" role="dialog" id="loginModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title">Log in</h3>
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
          </div>

        <form action="#" @submit.prevent="login">
          <div class="modal-body">
            <div class="form-group">
              <input
                type="text"
                name="username"
                class="form-control"
                placeholder="Username"
                v-model="username"
              />
            </div>
            <div class="form-group">
              <input
                type="password"
                name="password"
                class="form-control"
                placeholder="Password"
                v-model="password"
              />
            </div>
            <p v-if="isError" class="error" style="margin-right: 150px;">*{{this.$store.state.error}}</p>
          </div>

          <div class="modal-footer">
            <p class="mr-auto">
              Don't have an account?
              <a
                data-toggle="modal"
                data-target="#registrationModal"
                data-dismiss="modal"
                class="item"
                >Sign up here</a
              >
            </p>
            <button type="submit" class="btn btn-success">Sign in</button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <div class="modal fade" role="dialog" id="registrationModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title">Registration</h3>
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
          </div>

        <form action="#" @submit.prevent="register">
          <div class="modal-body">
            <div class="form-group">
              <input
                type="text"
                name="username"
                class="form-control"
                placeholder="Username"
                v-model="username"
              />
            </div>
            <div class="form-group">
              <input
                type="text"
                name="email"
                class="form-control"
                placeholder="Email"
                v-model="email"
              />
            </div>
            <div class="form-group">
              <input
                type="password"
                name="password"
                class="form-control"
                placeholder="Password"
                v-model="password"
              />
            </div>
            <p v-if="isError" class="error">*{{this.$store.state.error}}</p>
          </div>

          <div class="modal-footer">
            <p class="mr-auto">
              Already registered?
              <a
                data-toggle="modal"
                data-target="#loginModal"
                data-dismiss="modal"
                class="item"
                >Log in Here</a
              >
            </p>
            <button type="submit" class="btn btn-success">Sign up</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import $ from 'jquery';

export default {
  name: "Header",
  data(){
    return {
      username: "",
      password: "",
      email: ""
    }
  },
  methods: {
    login() {
      this.$store.dispatch('retrieveToken', {
        username: this.username,
        password: this.password
      })
    },
    register() {
      this.$store.dispatch('createToken', {
        username: this.username,
        email: this.email,
        password: this.password
      })
    },
    clearError(){
      this.$store.dispatch('clearError');
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn
    },
    isError(){
      return this.$store.getters.isError
    }
  },
  watch: {
    isLoggedIn(newValue) {
      if(newValue) {
        $('#loginModal, #registrationModal').modal('hide')
      }
    }
  },
  mounted(){
    $('#loginModal, #registrationModal').on('hidden.bs.modal', () => {
      this.clearError();
    })
  }
};
</script>

<style scoped>
.item {
  font-weight: bold;
}

.item:hover {
  cursor: pointer;
  background-color: darkgoldenrod;
}

.postBtn {
  margin-right: 0px;
  width: 250px;
  font-weight: bold;
  border: 2px solid #000;
}

.error {
  font-size: 12px;
  color: #DC143C;
  display: flex;
}
</style>
