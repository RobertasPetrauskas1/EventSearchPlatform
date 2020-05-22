<template>
  <div>
      <div v-for="user in users" :key="user.id">
          {{user.user_name}} <v-btn class="btn btn-light" @click="loginUser(user)">Login</v-btn>
      </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
export default {
    computed: {
        ...mapState(['users'])
    },
    mounted(){
        this.$store.dispatch("loadUsers");
    },
    methods: {
        loginUser(user){
            this.$store.dispatch('loginUser', user);
            console.log(user);
        }
    }
}
</script>

<style>

</style>