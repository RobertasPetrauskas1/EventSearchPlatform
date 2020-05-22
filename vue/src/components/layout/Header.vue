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
            <router-link to="/newEvent" class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" style="margin-right: 0px"  class="btn btn-warning postBtn">
                  Paskelbk renginį
                </button>
              </a>
            </router-link>
            <div class="dropdown">
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

          <div class="modal-body">
            <div class="form-group">
              <input
                type="text"
                name="username"
                class="form-control"
                placeholder="Username"
              />
            </div>
            <div class="form-group">
              <input
                type="text"
                name="email"
                class="form-control"
                placeholder="Email"
              />
            </div>
            <div class="form-group">
              <input
                type="text"
                name="password"
                class="form-control"
                placeholder="Password"
              />
            </div>
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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Header",
  data(){
    return {
      username: "",
      password: "",
    }
  },
  methods: {
    login() {
      this.$store.dispatch('retrieveToken', {
        username: this.username,
        password: this.password,
      })
        .then(res => {
          console.log(res);
          this.$router.push('/');
        })
    }
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
</style>
