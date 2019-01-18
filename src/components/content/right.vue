<template>
  <div class="left-content">
    <div class="header">
      <div class="desc">{{descmsg}}</div>
      <div class="select-type">
        <el-button
          :type="navigation.type"
          :size="navigation.size"
          v-for="(item,index) in navigation.options"
          :key="index"
        >{{item.type_name}}</el-button>
      </div>
    </div>
    <div class="content">
      <div v-for="(type,index) in navigation.options" :key="index">
        <p class="type-title">{{type.type_name}}</p>
        <div
          v-for="(item, key) in elements"
          :key="key"
          class="elements"
          v-show="item.type.type_name == type.type_name"
        >
          <Element :element="item"/>
        </div>
        <div style="clear:both"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Element from "./element";
import axios from "axios"

export default {
  data: () => ({
    descmsg: "印记中文出品，唯一与官方文档同步的中文文档",
    url: 'http://localhost:1337/',
    navigation: {
      type: "primary",
      size: "small ",
      options: [],
    },
    elements: [],  //存放所有资源元素
  }),
  components: {
    Element
  },
  created:  function(){
    this.initData();
  },
  methods:{
    initData() {
      //获取所有类型
      axios.get(this.url + 'classifies',{})
        .then(res => {
          this.navigation.options = res.data;
        })
        .then(() => {
          this.getElementsData();
        })
        .catch(err => {
          console.log(err)
        })
    },
    getElementsData() {  //获取所有资源元素
      axios.get(this.url + 'elements',{})
        .then(res => {
          this.elements = res.data;
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
};
</script>

<style lang="stylus" scoped>
.header {
  .desc {
    color: red;
    font-weight: 700;
  }

  .select-type {
    margin-top: 15px;
    margin-bottom: 15px;
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

  .elements {
    :last-child {
      clear: right;
    }

    :hover {
      background: #F2F6FC;
    }
  }
}
</style>
