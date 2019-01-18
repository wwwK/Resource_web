<template>
  <div class="hello">
    <el-container class="container">
      <el-header>
        <Header @to="chengeMain"/>
      </el-header>
      <el-main class="content">
        <router-view/>
      </el-main>
      <el-footer></el-footer>
    </el-container>
  </div>
</template>

<script>
// import Partner from './components/partner/partner'
import Main from "./content/main";
import Header from "./header/header";

export default {
  name: "HelloWorld",
  props: {
    msg: String
  },
  components: {
    Main,
    Header
  },
  methods:{
    chengeMain(to) {
      this.$router.push('./' + to.which);  //跳转到管理页面
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
  .hello
    height 100%
    .container
      height:100%
      width:80%
      margin 0 auto
      .content
        background rgb(240,240,240)
        min-height calc(100% - 120px)
</style>
