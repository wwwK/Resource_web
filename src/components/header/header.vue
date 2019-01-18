<template>
  <div class="header">
    <el-row class="top-menu">
      <el-col :span="6" class="logo-wrapper">
        <img src="./logo.png" alt>
      </el-col>
      <el-col :span="10" class>
        <el-button type="primary" @click="to('admin')">管理员界面</el-button>
        <el-button type="primary" @click="to('main')">主界面</el-button>
      </el-col>
      <el-col :span="6" :offset="2">
        <el-input placeholder="请输入内容" v-model="searchContent">
          <el-button slot="append" icon="el-icon-search" @click="tosearch()"></el-button>
        </el-input>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data: () => ({
    searchContent: ""
  }),
  methods: {
    //搜索內容
    tosearch() {
      this.$message("搜索的內容為：" + this.searchContent);
    },
    goBack() {
      window.history.length > 1 ? this.$router.go(-1) : this.$router.push("/");
    },
    //跳转到管理员界面
    to(which) {
      this.$emit('to',{which});
      return
    }
  }
};
</script>

<style lang="stylus" scoped>
.header {
  height: 100%;
  overflow: hidden;

  .top-menu {
    margin: 0 auto;
  }
}
</style>
