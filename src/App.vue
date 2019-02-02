<template>
  <div id="app">
        <HelloWorld/>
  </div>
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "app",
  components: {
    HelloWorld
  },
  created() {
    this.getInformation();
  },
  methods: {
    getInformation() {
      var x = navigator;
      var information = {
        CodeName: x.appCodeName,
        Name: x.appName,
        Version: x.appVersion,
        Platform: x.platform,
        UA: x.userAgent
      };

      this.$.ajax({
        type: this.api.browserinsert.type,
        url: this.api.browserinsert.url,
        data: {
          'CodeName': x.appCodeName,
          'Name': x.appName,
          'Version': x.appVersion,
          'Platform': x.platform,
          'UA': x.userAgent
        }
      });
    }
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
