<template>
  <div class="hello">
    <el-container class="container">
      <el-header class="el-header">
        <Header @to="chengeMain"/>
      </el-header>
      <el-main class="content">
        <el-row>
          <el-col :lg="2" :xl="3">&nbsp;</el-col>
          <el-col :lg="20" :xl="18">
            <router-view/>
          </el-col>
          <el-col :lg="2" :xl="3">&nbsp;</el-col>
        </el-row>
      </el-main>
      <el-footer class="footer-wrapper">
        <Footer/>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import Header from "./header/header";
import Footer from "./footer/footer";

export default {
  name: "HelloWorld",
  props: {
    msg: String
  },
  data: () => ({}),
  components: {
    Header,
    Footer
  },
  methods: {
    chengeMain(to) {
      if (to.which == "admin") {
        var user = sessionStorage.getItem("username");
        if (!user) {
          this.$message({
            showClose: true,
            type: "warning",
            message: "请先登录"
          });
        } else {
          this.$router.push("./" + to.which); //跳转到管理页面
        }
      } else {
        this.$router.push("./" + to.which); //跳转到首页页面
      }
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
.hello {
  height: 100%;

  .container {
    min-height: 100%;
    width: 100%;
    margin: 0 auto;

    .el-header {
      position: fixed;
      width: 100%;
      top: 0;
      left: 0;
      padding: 0;
      z-index: 100;
    }

    .content {
      margin-top: 60px;
      background: rgb(240, 240, 240);
      min-height: calc(100% - 120px);
    }

    .footer-wrapper {
      background: rgb(240, 240, 240);
    }
  }
}
</style>
