<template>
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
</template>

<script>
export default {
  props: {
    loginDialog: {}
  },
  data: () => ({
    loginFrom: {},
  }),
  methods:{
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
                this.$refs["loginFrom"].resetFields(); //重置表单，保护信息
                
                //获取登录时间
                var time = new Date((new Date()).valueOf()).toLocaleString(); 
                sessionStorage.setItem("username", res.name); //保存当前用户名到浏览器
                sessionStorage.setItem("loginTime", time);  //最近一次登录时间
                //向父组件传值
                this.$emit('CloseDialog', {'state':false,'username':res.name});
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
  }
};
</script>

<style lang="stylus" scoped>
</style>

