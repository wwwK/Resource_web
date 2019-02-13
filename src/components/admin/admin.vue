<template>  
  <div class="menu">
    <el-tabs v-model="activeName">
      <el-tab-pane label="资源管理" name="elements">
          <Elementadmin :elements='elements' :options='options'/>
      </el-tab-pane>
      <el-tab-pane label="资源类型管理" name="classtify">
          <Classtifyadmin :elements='elements' :options='options'/>
      </el-tab-pane>
      <el-tab-pane label="信息统计" name="users">
        <InformationStatistics/>
      </el-tab-pane>
    </el-tabs>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%"
      :close-on-click-modal='false'
      :close-on-press-escape='false'
      :show-close='false'
      >
      <p class="info">检测到您未登录，无对数据的操作权限！</p>
      <p class="info">
        <span class="time">{{time}}</span>
        s后将自动跳转到首页！
      </p>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="JumpImmediately()">立即跳转</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import Elementadmin from "./element_Admin";
import Classtifyadmin from "./classfiy_Admin";
import InformationStatistics from "./InformationStatistics";
import axios from "axios";

export default {
  data: () => ({
    activeName: "elements", //默认选择展开第一个选项卡
    dialogVisible: false,
    time: 5
  }),
  components: {
    Elementadmin,
    Classtifyadmin,
    InformationStatistics
  },
  computed: {
    options() {
      return this.$store.state.options;
    },
    elements() {
      return this.$store.state.elements;
    }
  },
  created: function() {
    if (!sessionStorage.getItem("username")) {
      this.dialogVisible = true;
      var timeInterval = setInterval(() => {
        this.time = this.time - 1;
      }, 1000);
      setTimeout(() => {
        clearInterval(timeInterval);
        this.$router.push("./main"); //跳转到首页页面
      }, 5000);
    }
  },
  methods: {
    JumpImmediately() {
      this.$router.push("./main"); //跳转到首页页面
    }
  }
};
</script>

<style lang="stylus" scoped>
.info
  font-size 20px
  .time
    color red
</style>
