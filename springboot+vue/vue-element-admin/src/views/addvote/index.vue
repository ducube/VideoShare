<template>
  <div class="app-container">
    <el-form ref="form" :model="list" :rules="rules" label-width="120px">
      <el-form-item label="名称" prop="voteName">
        <el-input v-model="list.voteName"/>
      </el-form-item>
      <el-form-item label="选项A" prop="optionA">
        <el-input v-model="list.optionA"/>
      </el-form-item>
      <el-form-item label="选项B" prop="optionB">
        <el-input v-model="list.optionB"/>
      </el-form-item>
      <el-form-item label="选项C">
        <el-input v-model="list.optionC"/>
      </el-form-item>
      <el-form-item label="选项D">
        <el-input v-model="list.optionD"/>
      </el-form-item>
      <el-form-item label="截止时间" prop="endTime">
        <el-date-picker type="datetime" placeholder="选择截止时间" v-model="list.endTime"  value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">添加</el-button>
        <el-button @click="onCancel()">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: {
        voteName: '',
        optionA: '',
        optionB: '',
        optionC: '',
        optionD: '',
        endTime: ''
      },
      rules: {
        voteName: [
          { required: true, message: '请输入名称', trigger: 'blur' }
        ],
        optionA: [
          { required: true, message: '请输入选项A', trigger: 'blur' }
        ],
        optionB: [
          { required: true, message: '请输入选项B', trigger: 'blur' }
        ],
        endTime: [
          { type: 'datetime', required: true, message: '请选择时间', trigger: 'change' }
        ]
      }
    }
  },
  methods: {
    onSubmit() {
      if('' == this.list.voteName || '' == this.list.optionA || '' == this.list.optionB|| '' == this.list.endTime){
        this.$message({
          message: '请确认信息完整性',
          type: 'error'
        })
        return
      }
      var vm = this
      this.axios({
        method: 'POST',
        data: vm.list,
        url: 'http://localhost:8081/vote/addVote'
      }).then(function(resp) {
        vm.$message({
          message: '添加成功',
          type: 'success'
        })
        vm.$router.push('/vote')
      })
    },
    onCancel() {
      this.$message({
        message: '返回中!',
        type: 'success'
      })
      this.$router.push('/vote')
    }
  }
}
</script>

<style scoped>
.line {
  text-align: center;
}
.el-input {
  width: 200px;
}
</style>

