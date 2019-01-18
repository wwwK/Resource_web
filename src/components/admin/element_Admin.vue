<template>
  <div class="element">
    <el-table :data="elements" style="width: 100%" border>
      <el-table-column label="标题" width="110" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.title }}</span>
        </template>
      </el-table-column>
      <el-table-column label="类别" width="150" align="center">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <span>{{ scope.row.type.type_name}}: {{ scope.row.type.type_desc }}</span>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.type.type_name }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="网址" width="220" align="center">
        <template slot-scope="scope">
          <a
            :href="scope.row.website"
            target="_blank"
            class="weblink"
            v-if="scope.row.website"
          >{{ scope.row.website }}</a>
          <span v-else>未填写</span>
        </template>
      </el-table-column>
      <el-table-column label="Github" width="180" align="center">
        <template slot-scope="scope">
          <a
            :href="scope.row.github"
            target="_blank"
            class="weblink"
            v-if="scope.row.github"
          >{{ scope.row.github }}</a>
          <span v-else>未填写</span>
        </template>
      </el-table-column>
      <el-table-column label="描述信息" align="center">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.desc}}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 信息编辑新增弹出层 -->
    <el-row class="add-wrapper">
      <el-col :span="8" :offset="15" style="text-align:right">
        <el-button type="primary" @click="addElement">添加</el-button>
      </el-col>
    </el-row>
    <el-dialog :title="dialogFormTitle" :visible.sync="dialogFormVisible">
        <el-form :model="elementForm" style="text-align:left" label-width="6em" ref="elementForm">
          <el-form-item label="ID" v-show='false'>
            <el-col :span="15">
              <el-input v-model="elementForm.id" disabled></el-input>
            </el-col>
          </el-form-item>
          <el-row>
            <el-col :span="12">
              <el-form-item
                label="标题"
                prop="title"
                :rules="{required: true, message: '标题不能为空', trigger: 'blur'}"
              >
                <el-input v-model="elementForm.title" placeholder></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="类型" prop="type" :rules="{required: true,message:'请选择类型',trigger: 'change'}">
                <el-select v-model="elementForm.type" placeholder="请选择类型">
                  <el-option
                    v-for="(item,id) in options"
                    :key="id"
                    :label="item.type_name"
                    :value="item.id"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-form-item
            label="网址"
            prop="website"
            :rules="{required: true, message: '网址不能为空', trigger: 'blur'}"
          >
            <el-col :span="15">
              <el-input v-model="elementForm.website"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="Github">
            <el-col :span="15">
              <el-input v-model="elementForm.github" placeholder='附上Github地址让你的项目更受欢迎'></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="描述信息">
            <el-col :span="20">
              <el-input type="textarea" v-model="elementForm.desc" :rows="3"  placeholder='请用简短的话进行简要描述'></el-input>
            </el-col>
          </el-form-item>
          <el-form-item>
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button @click="resetForm('elementForm')">重 置</el-button>
            <el-button type="primary" @click="fromSubmit('elementForm')">确 定</el-button>
          </el-form-item>
        </el-form>
    </el-dialog>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: {
    elements: {
      type: Array
    },
    options: {
      type: Array
    }
  },
  data: () => ({
    url: "http://localhost:1337/",
    dialogFormVisible: false,
    dialogFormTitle: "编辑内容",
    operation: "", //当前表单的操作
    elementForm: {
      title: "",
      desc: "",
      website: "",
      github: "",
      type: ""
    },
    rules: {
      //表单验证规则
      title: [{ require: true, message: "请输入标题", trigger: "blur" }]
    }
  }),
  methods: {
    //修改
    handleEdit(index, row) {
      this.dialogFormVisible = true; //显示弹出层
      this.elementForm = row; //显示当前行的数据
      this.operation = "edit"; //当前为修改操作
    },
    //删除
    handleDelete(index, row) {
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          if (this.deleteOneData(row.id)) {
            this.$message({
              type: "success",
              message: "删除成功!"
            });
            this.$emit("upAllData"); //重新获取数据
          }
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },

    //添加
    addElement() {
      this.dialogFormVisible = true; //显示弹出层
      this.elementForm = {}; //清空原有数据
      this.operation = "add"; //当前为添加操作
    },
    //提交表单
    fromSubmit(elementForm) {
      this.$refs[elementForm].validate(valid => {
        if (valid) {
          if (this.operation == "edit") {
            this.upOneData(this.elementForm.id);
          }

          if (this.operation == "add") {
            this.addData();
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },

    //重置表单
    resetForm(elementForm) {
      this.$refs[elementForm].resetFields();
    },

    //删除数据
    deleteOneData(id) {
      axios
        .delete(this.url + "elements/" + id, {})
        .then(res => {
          this.$message({
            message: "删除成功",
            type: "success"
          });
          return true;
        })
        .catch(err => {
          this.$message.error("删除失败");
        });
    },

    //添加数据
    addData() {
      console.log(this.elementForm);
      axios
        .post(this.url + "elements/", {
          title: this.elementForm.title,
          desc: this.elementForm.desc,
          website: this.elementForm.website,
          github: this.elementForm.github,
          type: this.elementForm.type
        })
        .then(res => {
          this.$message({
            message: "添加成功",
            type: "success"
          });
          this.dialogFormVisible = false; //关闭弹出层
          this.$emit("upAllData"); //重新获取数据
        })
        .catch(err => {
          this.$message.error("添加失败");
        });
    },

    //更新数据,接收ID值
    upOneData(id) {
      axios
        .put(this.url + "elements/" + id, {
          title: this.elementForm.title,
          desc: this.elementForm.desc,
          website: this.elementForm.website,
          github: this.elementForm.github,
          type: this.elementForm.type
        })
        .then(res => {
          this.$message({
            message: "修改成功",
            type: "success"
          });
          this.dialogFormVisible = false; //关闭弹出层
          this.$emit("upAllData"); //重新获取数据
        })
        .catch(err => {
          this.$message.error("修改失败");
        });
    }
  }
};
</script>

<style lang="stylus" scoped>
.weblink {
  color: #409EFF;
}

.add-wrapper {
  margin-top: 10px;
}
</style>
