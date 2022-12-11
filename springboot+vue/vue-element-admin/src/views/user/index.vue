<template>
  <div class="app-container">
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item label="视频用户名">
        <el-input v-model="username"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="warning" @click="onSubmit">查询</el-button>
      </el-form-item>
<!--      <el-form-item>-->
<!--        <el-button type="success" @click="adduser">添加用户</el-button>-->
<!--      </el-form-item>-->
    </el-form>
    <el-table
      :data="list"
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="序号" width="95">
        <template slot-scope="scope">
          {{ scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="用户ID" width="95">
        <template slot-scope="scope">
          {{ scope.row.userId }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="用户名">
        <template slot-scope="scope">
          {{ scope.row.userName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="性别" width="95">
        <template slot-scope="scope">
          {{ scope.row.userSex }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="年龄">
        <template slot-scope="scope">
          {{ scope.row.userAge }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="粉丝" width="95">
        <template slot-scope="scope">
          {{ scope.row.fanNum }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="手机号">
        <template slot-scope="scope">
          {{ scope.row.userTel }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="注册日期" width="160">
        <template slot-scope="scope">
          {{ scope.row.registerDate }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="用户状态">
        <template slot-scope="scope">
          {{ scope.row.tState.stateName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="会员等级" width="130">
        <template slot-scope="scope">
          {{ scope.row.level ==0?"普通用户":"会员"+scope.row.level }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="330" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="edituser(scope.row.userId)">
            编辑
          </el-button>
          <el-button type="danger" size="mini" @click="deluser(scope.row.userId)">
            删除
          </el-button>
          <el-button type="primary" size="mini" @click="openLevel(scope.row.userId)">设置等级</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList"/>

    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="20%">
      <el-select v-model="option" placeholder="请选择会员限制">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="setLevel()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
export default {
  components: { Pagination },
  data() {
    return {
      userLevel: {
        'userId': null,
        'level':null
      },
      dialogVisible: false,
      username: '',
      total: 0,
      listQuery: {
        page: 1,
        limit: 10
      },
      list: [{
        'tState': {
          'stateId': null,
          'stateName': '认证中'
        },
        'userId': 1,
        'userName': 'yourname',
        'userAge': 123456,
        'userSex': '男',
        'password': '123456',
        'encryptedProblem': '123',
        'fanNum': null,
        'userTel': '15566666626',
        'registerDate': '2021-04-02T07:17:10.000+0000',
        'iconUrl': null,
        'stateId': 1
      }
      ],
      option: -1,
      options: [
        {
          value: -1,
          label: '请选择'
        },
        {
          value: 0,
          label: '普通用户'
        }, {
          value: 1,
          label: '会员1'
        }, {
          value: 2,
          label: '会员2'
        }, {
          value: 3,
          label: '会员3'
        }, {
          value: 4,
          label: '会员4'
        }]
    }
  },
  created() {
    // this.fetchData()
    this.getList()
  },

  methods: {
    onSubmit() {
      var vm = this
      this.axios({
        method: 'GET',
        url: 'http://localhost:8081/admin/searchUser?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit + '&username=' + vm.username
      }).then(function(resp) {
        vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
        vm.list = resp.data.list
      })
    },
    getList() {
      var vm = this
      this.axios({
        method: 'GET',
        url: 'http://localhost:8081/admin/pageInfo?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit
      }).then(function(resp) {
        vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
        vm.list = resp.data.list
      })
    },
    adduser() {
      this.$router.push('/adduser/index')
    },
    edituser(id) {
      this.$router.push('/edituser/index/' + id)
    },
    deluser(id) {
      var vm = this
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        vm.axios({
          method: 'GET',
          url: 'http://localhost:8081/admin/deleteUser/' + id
        }).then(function(resp) {
          if (resp.data === 'success') {
            vm.$message({
              message: '删除成功',
              type: 'success'
            })
            vm.getList()
          }
          // eslint-disable-next-line handle-callback-err
        }).catch(function(error) {
          vm.$message.error('删除失败')
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      })
    },
    // 获视频列表
    fetchData() {
      var vm = this
      this.axios({
        method: 'GET',
        url: 'http://localhost:8081/admin/list'
      }).then(function(resp) {
        vm.list = resp.data
        console.log(resp.data)
      })
    },
    setLevel() {
      var vm = this
      if (vm.option < 0) {
        vm.$message({
          message: '请选择会员限制',
          type: 'info'
        })
        return
      }
      vm.userLevel.level = vm.option
      this.axios({
        method: 'POST',
        data: vm.userLevel,
        url: 'http://localhost:8081/user/updateLevel'
      }).then(function(resp) {
        vm.$message({
          message: '设置成功',
          type: 'success'
        })
        vm.dialogVisible = false
        vm.getList()
      })
    },
    openLevel(vid) {
      this.dialogVisible = true
      this.userLevel.userId = vid
    }
  }
}
</script>
