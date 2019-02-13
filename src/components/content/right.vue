<template>
  <div class="right-content" id="right">
    <div class="header">
      <div class="desc">
        <el-row>
          <el-col :xs="0" :sm="17">{{descmsg}}</el-col>
          <el-col :xs="24" :sm="7">
            <el-input placeholder="请输入检索内容" v-model="serchContent" size="small" @keyup.enter.native='toSearch()'>
              <el-button slot="append" icon="el-icon-search" @click="toSearch"></el-button>
            </el-input>
          </el-col>
        </el-row>
      </div>
      <div class="select-type">
        <el-tag
          :type="navigation.type"
          :size="navigation.size"
          v-for="(item,index) in haveoptions"
          :key="index"
          :hit="true"
          class="tag"
        >
        <span @click="toTegional(item)" class='text'>{{item}}</span>
        </el-tag>
      </div>
    </div>
    <div class="content">
      <div v-for="(typename,index) in haveoptions" :key="index" class="type-model">
        <p class="type-title" :id="typename"  :v-if="haveoptions.indexOf(typename) >= 0 ? true : false">{{typename}}</p>
        <div
          v-for="(item, key) in elements"
          :key="key"
          class="elements"
          v-show="(item.type_name == typename) && ((item.title.toLowerCase()).indexOf(fillterContent.toLowerCase()) != -1)"
        >
        <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="6">
          <Element :element="item"/>
        </el-col>
        </div>
        <div style="clear:both"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Element from "./element";
import axios from "axios";

export default {
  data: () => ({
    descmsg:
      "此网站内容是为以前端技术为主的资源链接，如有错误或提议，可扫描左方二维码联系作者",
    navigation: {
      type: "success",
      size: "small ",
      options: []
    },
    serchContent: "",
    fillterContent: ""
  }),
  computed:{
    haveoptions(){
      return this.$store.state.haveoptions;
    },
    elements(){
      return this.$store.state.elements;
    },
  },
  components: {
    Element
  },
  methods: {
    toTegional(module) {
      window.location.hash = "#" + module;   //滚动到指定位置
      var top = document.documentElement.scrollTop || document.body.scrollTop;   //获取页面当前的滚动距离
      document.documentElement.scrollTop= top - 65;    //设置页面向下滚动62像素，预留出header的位置
    },
    toSearch() {
      //搜索内容
      this.fillterContent = this.serchContent;
    }
  }
};
</script>

<style lang="stylus" scoped>
.el-tag {
  padding: 0;
}

.header {
  .desc {
    color: red;
    font-weight: 700;
  }

  .select-type {
    margin-top: 15px;
    margin-bottom: 15px;

    .tag {
      margin: 5px 5px;
      cursor: pointer;
      
      &:hover {
        .anchor-link {
          span {
            color: #ffffff;
          }
        }
        background: #67c23a;
        color: #ffffff;
      }

      .text{
        display: inline-block;
        width: 100%;
        height: 100%;
        padding: 0 8px;
      }
    }
  }
}

.content {
  .type-title {
    line-height: 1.5em;
    padding: 5;
    margin: 10px 0 10px;
    font-weight: 700;
    border-bottom: 2px solid #cccccc;
  }
}
</style>
