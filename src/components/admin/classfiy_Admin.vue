<template>
  <div class="element">
    <el-table
      :data="options.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100%"
      border
    >
      <el-table-column label="类型名称" width="180" align="center" :sortable="true" prop='type_name'>
      </el-table-column>
      <el-table-column label="编号" width="100" align="center" :sortable='true'  prop="number">
      </el-table-column>
      <el-table-column label="描述" align="left" prop='type_desc'>
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <div :v-if="options.length > pageSize">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="options.length"
        :page-size="pageSize"
        :current-page="currentPage"
        @current-change="handleCurrentChange"
        @prev-click="(currentPage)=>{currentPage--}"
        @next-click="(currentPage)=>{currentPage++}"
      ></el-pagination>
    </div>
    <!-- 信息编辑新增弹出层 -->
    <el-row class="add-wrapper">
      <el-col :span="8" :offset="15" style="text-align:right">
        <el-button type="primary" @click="addClassfiy">添加</el-button>
      </el-col>
    </el-row>
    <el-dialog
      :title="dialogFormTitle"
      :visible.sync="dialogFormVisible"
      style="max-height :670px;"
      @close='cancel()'
    >
      <el-form :model="classfiyFrom" style="text-align:left" label-width="6em" ref="classfiyFrom">
        <el-form-item
          label="编号"
          prop="number"
          :rules="{required: true, message: '编号不能为空,且为数字', trigger: 'blur'}"
        >
          <el-col :span="15">
            <el-input v-model="classfiyFrom.number" placeholder type="number"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item
          label="类型名称"
          prop="type_name"
          :rules="{required: true, message: '类型名称不能为空', trigger:'blur'}"
        >
          <el-input v-model="classfiyFrom.type_name" placeholder="类型名称"></el-input>
        </el-form-item>
        <el-form-item label="描述">
          <el-input v-model="classfiyFrom.type_desc" type="textarea" placeholder="请填写简要描述信息"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="cancel()">取 消</el-button>
          <el-button @click="resetForm('classfiyFrom')">重 置</el-button>
          <el-button type="primary" @click="fromSubmit('classfiyFrom')">确 定</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  props: {
    options: {
      type: Array
    },
    elements: {
      type: Array
    }
  },
  data: () => ({
    currentPage: 1, //当前显示页数
    pageSize: 10, //每页显示数量
    search: "",
    dialogFormVisible: false,
    dialogFormTitle: "",
    classfiyFrom: {},
    operation: ""
  }),
  methods: {
    //分页改变
    handleCurrentChange(size) {
      this.currentPage = size;
    },
    handleEdit(index, row) {
      //编辑信息
      this.dialogFormTitle = "编辑内容";
      this.dialogFormVisible = true; //弹出弹出层
      this.classfiyFrom = row;
      this.operation = "edit"; //当前为添加操作
    },
    handleDelete(index, row) {
      //删除信息
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$.ajax({
            type: this.api.classifiesDeleteOne.type,
            url: this.api.classifiesDeleteOne.url,
            data: {
              id: row.id
            },
            success: res => {
              res = JSON.parse(res);
              if (res.state) {
                this.$message({
                  message: res.msg,
                  type: "success"
                });
                //this.$emit("upAllData"); //重新获取数据
                this.$store.commit('datainit');
              } else {
                this.$message({
                  message: res.msg,
                  type: "warning"
                });
              }
            },
            error: err => {
              console.log(err);
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },
    addClassfiy() {
      //添加信息
      this.dialogFormTitle = "添加新类型";
      this.dialogFormVisible = true; //弹出弹出层
      this.classfiyFrom = {}; //清空原有数据
      this.operation = "add"; //当前为添加操作
    },

    //取消表单
    cancel() {
      this.dialogFormVisible = false;
      this.resetForm("classfiyFrom");
    },

    //重置表单
    resetForm(classfiyFrom) {
      this.$refs[classfiyFrom].resetFields();
    },
    fromSubmit(classfiyFrom) {
      //提交表单
      this.$refs[classfiyFrom].validate(valid => {
        if (valid) {
          if (this.operation == "add") {
            this.addData();
          }
          if (this.operation == "edit") {
            this.upOneData(this.classfiyFrom.id);
          }
        } else {
          this.$message("提交失败");
        }
      });
    },
    //添加数据
    addData() {
      this.$.ajax({
        type: this.api.classifiesAddOne.type,
        url: this.api.classifiesAddOne.url,
        data: {
          number: this.classfiyFrom.number,
          type_name: this.classfiyFrom.type_name,
          type_desc: this.classfiyFrom.type_desc || "无描述"
        },
        success: res => {
          res = JSON.parse(res);
          if (res.state) {
            this.$message({
              message: res.msg,
              type: "success"
            });
            this.successed(); //操作成功后执行
          } else {
            this.$message({
              message: res.msg,
              type: "warning"
            });
          }
        },
        error: err => {
          console.log(err);
          this.$message.error("添加失败");
        }
      });
    },

    //更新数据,接收ID值
    upOneData(id) {
      this.$.ajax({
        type: this.api.classifiesUpdate.type,
        url: this.api.classifiesUpdate.url,
        data: {
          id: id,
          number: this.classfiyFrom.number,
          type_name: this.classfiyFrom.type_name,
          type_desc: this.classfiyFrom.type_desc
        },
        success: res => {
          res = JSON.parse(res);
          this.$message({
            message: res.msg,
            type: "success"
          });
          this.successed(); //操作成功后执行
        },
        error: err => {
          console.log(err);
          this.$message.error("添加失败");
        }
      });
    },
    //操作成功
    successed() {
      this.dialogFormVisible = false; //关闭弹出层
      //this.$emit("upAllData"); //重新获取数据
      this.$store.commit('datainit');
    }
  }
};
</script>

<style lang="stylus" scoped>
</style>
