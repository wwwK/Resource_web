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
    <el-dialog title="管理员登陆" :visible.sync="loginDialog" width="400px">
      <el-form :model="loginFrom" label-width="5em" ref="loginFrom">
        <el-form-item
          label="用户名"
          prop="name"
          :rules="{required: true, message: '账号不能为空', trigger: 'blur'}"
        >
          <el-col :span="20">
            <el-input type="text" v-model="loginFrom.name"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item
          label="密码"
          prop="password"
          :rules="{required: true, message: '密码不能为空', trigger: 'blur'}"
        >
          <el-col :span="20">
            <el-input type="password" v-model="loginFrom.password"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label>
          <el-col :span="16" :offset="1">
            <el-button @click="loginDialog = false" size="small">取 消</el-button>
            <el-button type="primary" @click="login('loginFrom')" size="small">确 定</el-button>
          </el-col>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>

export default {
  data: () => ({
    searchContent: "",
    loginDialog: false,
    loginFrom: {},
    username: ""
  }),
  created: function() {
    this.username = sessionStorage.getItem("username");
  },
  methods: {
    logoin(){
      var user = sessionStorage.getItem("username");
      var loginTime = sessionStorage.getItem("loginTime");
      if(user){
        this.$notify({
          title: '登录信息',
          type: 'warning',
          dangerouslyUseHTMLString: true,
          message:`<p>用户名：${user}</p><p>登录时间:${loginTime}</p>`,
          offset: 100
        });
      }else{
        this.loginDialog = true;
      }
    },
    logout() {
      //退出登陆
      this.username = "";
      sessionStorage.removeItem("username");
    },
    //登陆
    login(loginFrom) {
      this.$refs[loginFrom].validate(valid => {
        if (valid) {
          this.$.ajax({
            type: this.api.administerQueryName.type,
            url:this.api.administerQueryName.url,
            data:this.loginFrom,
            success:(res)=> {
              res =JSON.parse(res);
              if(res.state){
                this.$message({
                  showClose: true,
                  type: "success",
                  message:res.msg,
                })
                this.loginDialog = false; //关闭登陆弹出层
                this.$refs["loginFrom"].resetFields(); //重置表单，保护信息
                this.username = res.name;

                //获取登录时间
                var time = new Date((new Date()).valueOf()).toLocaleString(); 
                sessionStorage.setItem("username", res.name); //保存当前用户名到浏览器
                sessionStorage.setItem("loginTime", time);  //最近一次登录时间
              }else{
                this.$message({
                  type: "error",
                  message:res.msg,
                })
              }
            },
            error:(err) => {
              console.log(err);
            }
          });
        } else {
          this.$message("登陆失败");
        }
      });
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
  background :#409EFF;
  height: 100%;
  overflow: hidden;
  .top-menu {
    padding: 0 auto;
    height :100%;
    .logo-wrapper {
      height :100%;
      text-align :left;
      .title {
        position : absolute;
        top: 30%;
        margin-left:0.5em;
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
