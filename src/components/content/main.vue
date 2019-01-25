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
     
  }
};
</script>

<style lang="stylus" scoped>
  .main
    margin 0 auto
    min-height 100%
    text-align left 
</style>
