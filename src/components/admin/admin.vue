<template>  
  <div class="menu">
    <el-tabs v-model="activeName">
      <el-tab-pane label="资源管理" name="elements">
          <Elementadmin :elements='elements' :options='options' @upAllData='initData'/>
      </el-tab-pane>
      <el-tab-pane label="资源类型管理" name="classtify">
          <Classtifyadmin :elements='elements' :options='options' @upAllData='initData'/>
      </el-tab-pane>
      <el-tab-pane label="账户管理" name="users">账户管理</el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import Elementadmin from './element_Admin'
import Classtifyadmin from './classfiy_Admin'
import axios from "axios";

export default {
  //测试提交到远程
  //测试提交dev分支
  data: () => ({
    activeName: "elements", //默认选择展开第一个选项卡
    url: "http://localhost:1337/",
    options: [],
    elements: [],
  }),
  components:{
      Elementadmin,Classtifyadmin
  },
  created: function() {
    this.initData();
  },
  methods: {
       initData() {
      //获取所有类型
      axios
        .get(this.url + "classifies", {})
        .then(res => {
          this.options = res.data;
          console.log(this.options)
        })
        .then(() => {
          this.getElementsData();
        })
        .catch(err => {
          console.log(err);
        });
    },
    getElementsData() {
      //获取所有资源元素
      axios
        .get(this.url + "elements", {})
        .then(res => {
          this.elements = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style lang="stylus" scoped>
</style>
