<template>
    <el-dialog title="管理员登陆" :visible.sync="loginDialog" width="400px" :close-on-click-modal='false' :show-close='false' :modal="false">
      <el-tabs :stretch='true'>
        <el-tab-pane label="密码登陆">
          <el-form :model="passwordFrom" label-width="5em" ref="passwordFrom" class="form">
            <el-form-item
              label="用户名"
              prop="name"
              :rules="{required: true, message: '账号不能为空', trigger: 'blur'}"
            >
              <el-col :span="20">
                <el-input type="text" v-model="passwordFrom.name"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item
              label="密码"
              prop="password"
              :rules="{required: true, message: '密码不能为空', trigger: 'blur'}"
            >
              <el-col :span="20">
                <el-input type="password" v-model="passwordFrom.password"></el-input>
              </el-col>
            </el-form-item>
            <div class="button-warpper">
                <el-button @click="cancelLanding()">取 消</el-button>
                <el-button type="primary" @click="login('passwordFrom')">登 陆</el-button>
            </div>
          </el-form>
        </el-tab-pane>
        <!-- 手机验证登陆 -->
        <el-tab-pane label="手机验证登陆">
          <el-form :model="phoneFrom" label-width="5em" ref="phoneFrom" class="form">
            <el-form-item
              label="手机号"
              prop="phone"
              :rules="{required: true, message: '手机号不能空', trigger: 'blur'}"
            >
              <el-col :span="20">
                <el-input type="text" v-model="phoneFrom.phone"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item
              label="验证码"
              prop="VerCode"
              :rules="{required: true, message: '验证码不能为空', trigger: 'blur'}"
            >
              <el-col :span="20">
                <el-input type="text" v-model="phoneFrom.VerCode">
                  <el-button slot="append" type="success" size="small" @click="getVerCode()" :disabled='VerCode.disabled'>
                  {{VerCode.text}}
                </el-button>
                </el-input>
              </el-col>
            </el-form-item>
            <div class="button-warpper">
                <el-button @click="cancelLanding()">取 消</el-button>
                <el-button type="primary" @click="loginByPhone('phoneFrom')">登 陆</el-button>
            </div>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-dialog>
</template>

<script>
export default {
  props: {
    loginDialog: {}
  },
  data: () => ({
    passwordFrom: {},
    phoneFrom: {},
    VerCode: {
      disabled: false,
      text: "获取验证码",
      time: 60
    },
    phoneLogoin: {
      //保存获取的临时登陆信息
      phone: "",
      VerCode: "",
      username: ""
    },
    timeInterval: ""
  }),
  methods: {
    //取消登陆
    cancelLanding() {
      this.$emit("CloseDialog", { state: false });
      this.resetForm("passwordFrom");
      this.resetForm("phoneFrom");
    },
    //重置表单
    resetForm(formname) {
      this.$refs[formname].resetFields();
      this.resetVercode();
    },
    //手机验证码登陆
    loginByPhone(phoneFrom) {
      this.$refs[phoneFrom].validate(valid => {
        if (valid) {
          if (
            this.phoneFrom.phone == this.phoneLogoin.phone &&
            this.phoneFrom.VerCode == this.phoneLogoin.VerCode
          ) {
            this.$message({
              showClose: true,
              type: "success",
              message: "登陆成功"
            });
            this.$refs["phoneFrom"].resetFields(); //重置表单，保护信息

            //获取登录时间
            var time = new Date(new Date().valueOf()).toLocaleString();
            sessionStorage.setItem("username", this.phoneLogoin.username); //保存当前用户名到浏览器
            this.$store.commit("landingChenge", {
              states: true, //登陆状态
              username: this.phoneLogoin.username,
              loginTime: time,
              loadingMode: "手机验证登陆"
            });
            //向父组件传值
            this.$emit("CloseDialog", {
              state: false,
              username: this.phoneLogoin.username
            });
            this.saveLoadingRecord("短信验证码", this.phoneLogoin.username); //保存登陆记录
            this.resetVercode();
          } else {
            this.$message({
              showClose: true,
              type: "warning",
              message: "登录失败！请输入正确的手机号和验证码！"
            });
          }
        }
      });
    },
    //获取验证码
    getVerCode() {
      if (!this.phoneFrom.phone) {
        this.$message({
          showClose: true,
          type: "warning",
          message: "请输入手机号码！"
        });
      } else if (this.phoneFrom.phone.length != 11) {
        this.$message({
          showClose: true,
          type: "error",
          message: "手机号码格式错误！请输入有效的手机号码！"
        });
      } else {
        this.$.ajax({
          type: this.api.loginByPhone.type,
          url: this.api.loginByPhone.url,
          data: { phone: this.phoneFrom.phone },
          success: res => {
            res = typeof res == "string" ? JSON.parse(res) : res;
            // console.log(res);
            if (res.state) {
              if (res.Message == "OK") {
                //提示发送成功消息
                this.$message({
                  showClose: true,
                  type: "success",
                  message: "验证码已发送，请注意查收！"
                });
                //保存可用信息
                this.phoneLogoin = {
                  phone: res.phone,
                  VerCode: res.VerCode,
                  username: res.username
                };
                //锁定获取验证码1分钟
                this.VerCode.disabled = true;
                this.timeInterval = setInterval(() => {
                  this.VerCode.text = this.VerCode.time-- + "s";
                  if (this.VerCode.time == 1) {
                    this.resetVercode();
                  }
                }, 1000);
              } else {
                this.$message({
                  showClose: true,
                  type: "error",
                  message: res.Message
                });
              }
            } else {
              this.$message({
                type: "error",
                message: res.msg
              });
            }
          },
          error: err => {
            console.log(err);
          }
        });
      }
    },
    resetVercode() {
      clearInterval(this.timeInterval);
      this.VerCode.disabled = false;
      this.VerCode.text = "获取验证码";
      this.VerCode.time = 60;
      //清楚之前的信息
      this.phoneLogoin = {
        phone: "",
        VerCode: "",
        username: ""
      };
    },
    login(passwordFrom) {
      this.$refs[passwordFrom].validate(valid => {
        if (valid) {
          this.$.ajax({
            type: this.api.administerQueryName.type,
            url: this.api.administerQueryName.url,
            data: this.passwordFrom,
            success: res => {
              res = JSON.parse(res);
              if (res.state) {
                this.$message({
                  showClose: true,
                  type: "success",
                  message: res.msg
                });
                this.$refs["passwordFrom"].resetFields(); //重置表单，保护信息
                //获取登录时间
                var time = new Date(new Date().valueOf()).toLocaleString();
                sessionStorage.setItem("username", res.name); //保存当前用户名到浏览器
                this.$store.commit("landingChenge", {
                  states: true, //登陆状态
                  username: res.name,
                  loginTime: time,
                  loadingMode: "账号密码登陆"
                });
                //向父组件传值
                this.$emit("CloseDialog", { state: false, username: res.name });
                this.saveLoadingRecord("账号密码", res.name); //保存登陆记录
              } else {
                this.$message({
                  type: "error",
                  message: res.msg
                });
              }
            },
            error: err => {
              console.log(err);
            }
          });
        } else {
          this.$message("登陆失败");
        }
      });
    },
    //保存登陆记录
    saveLoadingRecord(mode = "未知", username) {
      this.$.ajax({
        type: this.api.savelandingRecord.type,
        url: this.api.savelandingRecord.url,
        data: {
          landingMode: mode,
          username: username,
          verCode: this.phoneLogoin.VerCode || "无"
        },
        error: error => {
          console.log(error);
        }
      });
    }
  }
};
</script>

<style lang="stylus" scoped>
.form {
  padding-top: 20px;
}
</style>

