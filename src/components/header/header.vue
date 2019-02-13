<template>
  <div class="header">
    <el-row class="top-menu">
      <el-col :span="12" class="logo-wrapper">
        <span @click="to('main')" class="title">邓占勇的资源空间</span>
      </el-col>
      <el-col :sm="12" style="text-align:right;margin-top:13px;padding-right:0.5em;">
        <el-button size="mini" class="login" @click="logoin">{{username || '登陆'}}</el-button>
        <el-button size="mini" class="login" @click="logout" v-if="username">退出登陆</el-button>
        <el-button size="mini" type="warning" icon="el-icon-setting"  @click="to('admin')"  circle></el-button>
      </el-col>
    </el-row>
    <LoginGUL :loginDialog='loginDialog' v-on:CloseDialog='CloseDialog'></LoginGUL>
  </div>
</template>

<script>
import LoginGUL from "./loginDialog";

export default {
  data: () => ({
    searchContent: "",
    loginDialog: false,
    username: ""
  }),
  components: {
    LoginGUL
  },
  created: function() {
    this.username = sessionStorage.getItem('username');
  },
  methods: {
    //显示登陆信息
    logoin() {
      var user = this.$store.state.landingInfo.username;
      var loginTime = this.$store.state.landingInfo.loginTime;
      var loadingMode = this.$store.state.landingInfo.loadingMode;
      if (user) {
        this.$notify({
          title: "登录信息",
          type: "warning",
          dangerouslyUseHTMLString: true,
          message: `<p>用户名：${user}</p><p>登录时间:${loginTime}</p><p>登陆方式：${loadingMode}</p>`,
          offset: 100
        });
      } else {
        this.loginDialog = true;
      }
    },
    logout() {
      //退出登陆
      this.username = "";
      sessionStorage.removeItem("username");
      this.$store.commit("landingChenge", {
        states: false, //登陆状态
        username: '',
        loginTime: '',
        loadingMode: ""
      });
    },
    //关闭弹出层
    CloseDialog(res) {
       this.loginDialog = res.state;
       this.username = res.username || "";
    },

    goBack() {
      window.history.length > 1 ? this.$router.go(-1) : this.$router.push("/");
    },
    //跳转到管理员界面
    to(which) {
      this.$emit("to", { which });
      return;
    }
  }
};
</script>

<style lang="stylus" scoped>
.header {
  background: #409EFF;
  height: 100%;
  overflow: hidden;

  .top-menu {
    padding: 0 auto;
    height: 100%;

    .logo-wrapper {
      height: 100%;
      text-align: left;

      .title {
        position: absolute;
        top: 30%;
        margin-left: 0.5em;
        cursor: pointer;
        line-height: 100%;
        font-size: 25px;
        font-weight: 700;
        cursor: pointer;
      }
    }
  }
}
</style>
