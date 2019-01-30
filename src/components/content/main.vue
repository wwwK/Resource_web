<template>
  <div class="main">
      <el-row :gutter="20" justify="space-around" class="main-row">
        <el-col :xs="0" :sm="4" class="left-wrapper">
          <Left/>
        </el-col>
        <el-col :xs="24" :sm="20" class="right-wrapper">
          <Right/>
        </el-col>
      </el-row>
      <div id="toTop" @click="toTop">
        <span class="text">回到<br/>顶部</span>
      </div>
  </div>
</template>

<script>

import Right from './right'
import Left from './left'

export default {
  data: () => ({
    show: true
  }),
  components:{
    Right,Left
  },
  methods:{
     toTop(){
       document.documentElement.scrollTop = 0;
     }
  }
};
</script>

<style lang="stylus" scoped>
  .main
    margin 0 auto
    min-height 100%
    text-align left 
    #toTop
      position fixed
      right 20px
      bottom 100px
      display inline-block
      width 60px
      height 60px
      background #ffffff
      text-align center
      cursor pointer
      border-radius 5px
      border 1px solid #409eff
      background rgb(219,230,242)
      .text
        display inline-block
        padding 7px
</style>
