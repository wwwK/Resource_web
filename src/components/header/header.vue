<template>
  <div class="header">
    <el-row class="top-menu">
      <el-col :span="6" class="logo-wrapper">
        <img src="./logo.png"  @click="to('main')" class="logo">
      </el-col>
      <el-col :span="8" class>
        <el-button type="primary" @click="to('admin')">管理员界面</el-button>
      </el-col>
      <el-col :span="4" :offset="6" style="text-align:right">
        <el-button size="mini" class="login" @click="loginDialog = true">{{username || '登陆'}}</el-button>
        <el-button size="mini" class="login"  @click="logout" v-if="username">退出登陆</el-button>
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

import axios from 'axios'
export default {
  data: () => ({
    url: "http://localhost:1337/",
    searchContent: "",
    loginDialog: false,
    loginFrom: {},
    username: '',
  }),
  created: function(){
    this.username = sessionStorage.getItem('username')
  },
  methods: {
    logout() { //退出登陆
      this.username = '';
      sessionStorage.removeItem('username')
    },
    //登陆
    login(loginFrom) {
      this.$refs[loginFrom].validate(valid => {
        if (valid) {
          axios
          .get(this.url + 'administrators/?name=' + this.loginFrom.name,{})
          .then(res => {
            if(res.data.length > 0){
              if(res.data[0].password == this.loginFrom.password){    //判断密码是否正确
                this.$message({
                  showClose: true,
                  type: 'success',
                  message: '登陆成功'
                }) 
                this.loginDialog = false;   //关闭登陆弹出层
                this.$refs['loginFrom'].resetFields();   //重置表单，保护信息
                this.username = res.data[0].name;
                sessionStorage.setItem("username",res.data[0].name);   //保存当前用户名到浏览器
              }else {
                 this.$message({
                  type: 'error',
                  message: '密码错误，请重新输入密码'
                })
              }
            }else{
              this.$message('该用户不存在，请填写正确的用户信息')
            }
          })
          .catch(srr => {

          })
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
  height: calc(100% - 10px);
  overflow: hidden;
  margin-top: 10px;

  .top-menu {
    padding: 0 auto;
    .logo-wrapper{
      .logo{
        cursor pointer
      }
    }

    .login {
      position: relative;
      top: 5px;
    }
  }
}
</style>
