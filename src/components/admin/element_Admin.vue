<template>
  <div class="element">
    <!-- 展示信息 -->
    <el-table
      :data="elements.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100%"
      border
    >
      <el-table-column label="标题" width="110" align="center" prop="title" :sortable="true">
      </el-table-column>
      <el-table-column label="类别" width="150" align="center" prop="type_name" :sortable="true">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <span>{{ scope.row.type_name}}: {{ scope.row.type_desc }}</span>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.type_name }}</el-tag>
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
      <el-table-column label="LOGO" width="70" align="center">
        <template slot-scope="scope">
          <img :src="scope.row.imgurl" style="height:50px;width:50px;">
        </template>
      </el-table-column>
      <el-table-column label="描述信息" align="center" prop="desc">
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <div :v-if="elements.length > pageSize">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="elements.length"
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
        <el-button type="primary" @click="addElement">添加</el-button>
      </el-col>
    </el-row>
    <el-dialog :title="dialogFormTitle" :visible.sync="dialogFormVisible" @close='cancel()'>
      <el-form :model="elementForm" style="text-align:left" label-width="6em" ref="elementForm">
        <el-form-item label="ID" v-show="false">
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
            <el-form-item
              label="类型"
              prop="type_name"
              :rules="{required: true,message:'请选择类型',trigger: 'change'}"
            >
              <el-select v-model="elementForm.type_name" placeholder="请选择类型">
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
            <el-input v-model="elementForm.github" placeholder="附上Github地址让你的项目更受欢迎"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="描述信息">
          <el-col :span="20">
            <el-input
              type="textarea"
              v-model="elementForm.desc"
              :rows="3"
              placeholder="请用简短的话进行简要描述"
            ></el-input>
          </el-col>
        </el-form-item>
        <el-form-item
          label="图片地址"
          prop="imgurl"
          :rules="{required: true, message: '请在下方上传图片,如需更改图片,只需点击原图片再次重新选择即可'}"
        >
          <el-col :span="20">
            <el-input v-model="elementForm.imgurl" placeholder="上传图片成功后自动获取地址" disabled></el-input>
          </el-col>
        </el-form-item>
        <el-upload
          class="avatar-uploader"
          action="http://www.xmwweb.cn/php/file/upload_file.php"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
        >
          <img v-if="imageUrl" :src="elementForm.imgurl" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <el-form-item>
          <el-col :span="10" :offset="12">
            <el-button @click="cancel()">取 消</el-button>
            <el-button @click="resetForm('elementForm')">重 置</el-button>
            <el-button type="primary" @click="fromSubmit('elementForm')">确 定</el-button>
          </el-col>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>

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
    currentPage: 1, //当前显示页数
    pageSize: 7, //每页显示数量
    imageUrl: "", //上传的图片地址
    dialogFormVisible: false,
    dialogFormTitle: "编辑内容",
    operation: "", //当前表单的操作
    elementForm: {
      title: "",
      desc: "",
      website: "",
      github: "",
      type: "",
      imgurl: ""
    },
    rules: {
      //表单验证规则
      title: [{ require: true, message: "请输入标题", trigger: "blur" }]
    }
  }),
  methods: {
    //分页改变
    handleCurrentChange(size) {
      this.currentPage = size;
      console.log(this.elements.length, this.pageSize);
    },
    //图片上传成功
    handleAvatarSuccess(res) {
      this.imageUrl = res.path;
      this.elementForm.imgurl = res.path;
    },
    //提交上传图片
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isPNG = file.type === "image/png";
      const isGIF = file.type === "image/gif";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG && !isPNG && !isGIF) {
        this.$message.error("上传图片只能是 JPG、PNG、GIT格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传图片大小不能超过 2MB!");
      }
      return (isJPG || isPNG || isGIF) && isLt2M;
    },
    //修改
    handleEdit(index, row) {
      this.dialogFormTitle = "修改内容";
      this.dialogFormVisible = true; //显示弹出层
      this.elementForm = row; //显示当前行的数据
      this.operation = "edit"; //
      this.imageUrl = row.imgurl;
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
      this.dialogFormTitle = "添加新内容";
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

    //取消表单
    cancel(){
      this.dialogFormVisible = false
      this.resetForm('elementForm')
    },

    //重置表单
    resetForm(elementForm) {
      this.$refs[elementForm].resetFields();
      this.imageUrl = "";
    },

    //删除数据
    deleteOneData(id) {
      this.$.ajax({
        type: this.api.elementsDeleteOne.type,
        url: this.api.elementsDeleteOne.url,
        data: {
          id: id
        },
        success: res => {
          res = JSON.parse(res);
          this.$message({
            message: res.msg,
            type: "success"
          });
          this.$emit("upAllData"); //重新获取数据
        },
        error: err => {
          console.log(err);
        }
      });
    },

    //添加数据
    addData() {
      this.$.ajax({
        type: this.api.elementsAddOne.type,
        url: this.api.elementsAddOne.url,
        data: {
          title: this.elementForm.title,
          desc: this.elementForm.desc || "",
          website: this.elementForm.website || "",
          github: this.elementForm.github || "",
          type: this.elementForm.type_name,
          imgurl: this.elementForm.imgurl
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
        type: this.api.elementsUpdate.type,
        url: this.api.elementsUpdate.url,
        data: {
          id: id,
          title: this.elementForm.title,
          desc: this.elementForm.desc || "",
          website: this.elementForm.website || "",
          github: this.elementForm.github || "",
          type: this.elementForm.typeId,
          imgurl: this.elementForm.imgurl
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
      this.$emit("upAllData"); //重新获取数据
      this.imageUrl = ""; //清楚预览图片
      this.resetForm('elementForm');  //重置表单
    }
  }
};
</script>

<style lang="stylus" scoped>
.avatar-uploader {
  width: 12em;
  height: 12em;
  border: 1px dashed #333333;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  margin-left: 7em;
  margin-bottom: 1em;
  overflow: hidden;
  background: #eeeeee;

  &:hover {
    background: rgb(245, 245, 245);
  }

  .avatar {
    width: 167px;
    height: 167px;
    display: block;
  }

  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 167px;
    height: 167px;
    line-height: 167px;
    text-align: center;
  }
}
</style>
