<template>  
  <div class="menu">
    <el-tabs v-model="activeName">
      <el-tab-pane label="资源管理" name="elements">
          <Elementadmin :elements='elements' :options='options' @upAllData='initData'/>
      </el-tab-pane>
      <el-tab-pane label="资源类型管理" name="classtify">
          <Classtifyadmin :elements='elements' :options='options' @upAllData='initData'/>
      </el-tab-pane>
      <el-tab-pane label="信息统计" name="users">
        <InformationStatistics/>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import Elementadmin from './element_Admin'
import Classtifyadmin from './classfiy_Admin'
import InformationStatistics from './InformationStatistics'
import axios from "axios";

export default {
  data: () => ({
    activeName: "elements", //默认选择展开第一个选项卡
    options: [],
    elements: [],
  }),
  components:{
      Elementadmin,Classtifyadmin,InformationStatistics
  },
  created: function() {
    this.initData();
  },
  methods: {
      initData() {
     //获取所有类型
      axios
        .get(this.api.classifiesQueryAll.url, {})
        .then(res => {
          this.options = res.data;
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
        .get(this.api.elementsQueryAll.url, {})
        .then(res => {
          this.elements = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
  }
};
</script>

<style lang="stylus" scoped>
</style>
