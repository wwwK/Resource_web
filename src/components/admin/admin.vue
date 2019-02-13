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
  }),
  components:{
      Elementadmin,Classtifyadmin,InformationStatistics
  },
  computed:{
    options(){
      return this.$store.state.options;
    },
    elements(){
      return this.$store.state.elements;
    },
  },
};
</script>

<style lang="stylus" scoped>
</style>
