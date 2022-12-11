<template>
  <div class="app-container">
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item label="投票名称">
        <el-input v-model="voteName"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="warning" @click="onSubmit">查询</el-button>
      </el-form-item>
      <el-form-item>
        <el-button type="success" @click="addVote">发起投票</el-button>
      </el-form-item>
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
      <el-table-column align="center" label="投票名称">
        <template slot-scope="scope">
          {{ scope.row.voteName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="选项A">
        <template slot-scope="scope">
          {{ scope.row.optionA }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="选项B">
        <template slot-scope="scope">
          {{ scope.row.optionB }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="选项C">
        <template slot-scope="scope">
          {{ scope.row.optionC }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="选项D">
        <template slot-scope="scope">
          {{ scope.row.optionD }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="截止时间">
        <template slot-scope="scope">
          {{ scope.row.endTime }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="投票人数">
        <template slot-scope="scope">
          {{ scope.row.count }}
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="queryTotal(scope.row.id)" :disabled="scope.row.count == 0">
            查看投票情况
          </el-button>
          <el-button type="danger" size="mini" @click="delVote(scope.row.id)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit"
                @pagination="getList"
    />

  </div>
</template>
<script>
  import Pagination from '@/components/Pagination' // secondary package based on el-pagination
  export default {
    components: {Pagination},
    data() {
      return {
        voteName: '',
        optionA: '',
        optionB: '',
        optionC: '',
        optionD: '',
        endTime: '',
        total: 0,
        listQuery: {
          page: 1,
          limit: 5
        },
        list: [

        ]
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
          url: 'http://localhost:8081/vote/page?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit + '&voteName=' + vm.voteName
        }).then(function (resp) {
          vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
          vm.list = resp.data.list
        })
      },
      getList() {
        var vm = this
        this.axios({
          method: 'GET',
          url: 'http://localhost:8081/vote/page?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit + '&voteName=' + vm.voteName
        }).then(function (resp) {
          vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
          vm.list = resp.data.list
        })
      },
      addVote() {
        this.$router.push('/addvote/index')
      },
      queryTotal(id){
        this.$router.push('/votetotal/index/' + id)
      },
      delVote(id) {
        var vm = this
        this.$confirm('此操作将删除该投票, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          vm.axios({
            method: 'GET',
            url: 'http://localhost:8081/vote/deleteVote/' + id
          }).then(function (resp) {
            if (resp.data === 'success') {
              vm.$message({
                message: '删除成功',
                type: 'success'
              })
              vm.getList()
            }
            // eslint-disable-next-line handle-callback-err
          }).catch(function (error) {
            vm.$message.error('删除失败')
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
      },
    }
  }
</script>
