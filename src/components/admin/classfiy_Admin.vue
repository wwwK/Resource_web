<template>
  <div class="element">
    <el-table :data="options" style="width: 100%" border >
      <el-table-column label="类型名称" width="180" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.type_name }}</span>
        </template>
      </el-table-column>
      <el-table-column label="编号" width="100"  align="center">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.number }}</span>
        </template>
      </el-table-column>
      <el-table-column label="描述" align="left" >
        <template slot-scope="scope" >
          <span style="margin-left: 10px">{{ scope.row.type_desc }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>

export default {
  props:{
    options: {
      type: Array
    },
  },
  data: () => ({
    url: "http://localhost:1337/",
    search: "",
  }),
  methods: {
    handleEdit(index, row) {
      console.log(index, row);
    },
    handleDelete(index, row) {
      console.log(index, row);
    },
   
  }
};
</script>

<style lang="stylus" scoped>
</style>
