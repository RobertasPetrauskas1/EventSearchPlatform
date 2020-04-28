<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #D3D3D3;">
      <div class="container" style="max-width: 800px;">
        <a href="#" class="navbar-brand">
          <img
            src="../../assets/logo.png"
            width="30"
            height="30"
            class="d-inline-block align-top"
            alt="logo"
          />
          <span>We</span>Go
        </a>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#CollapseMenu">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="CollapseMenu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" class="btn btn-outline-success">Renginiai</button>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <button type="button" class="btn btn-outline-info">Žemėlapis</button>
              </a>
            </li>
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
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown_menu">
                  <a class="dropdown-item">Log in</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item">Sign up</a>
                </div>
              </li>
            </div>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "Header"
};
</script>

<style scoped>
</style>