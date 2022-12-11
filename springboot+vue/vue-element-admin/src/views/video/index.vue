<template>
  <div class="app-container">
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item label="视频名称">
        <el-input v-model="videoName"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="warning" @click="onSubmit">查询</el-button>
      </el-form-item>
      <!--   <el-form-item>
           <el-button type="success" @click="addvideo">添加视频</el-button>
         </el-form-item>-->
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
      <el-table-column align="center" label="视频名称">
        <template slot-scope="scope">
          {{ scope.row.videoTitle }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="播放量" width="95">
        <template slot-scope="scope">
          {{ scope.row.viewNum }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="视频类型" width="95">
        <template slot-scope="scope">
          {{ scope.row.videoType.typeName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="上传日期">
        <template slot-scope="scope">
          {{ scope.row.editDate }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="用户">
        <template slot-scope="scope">
          {{ scope.row.userName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="状态" width="95">
        <template slot-scope="scope">
          {{ scope.row.videoState.stateName }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="会员观看等级限制" width="130">
        <template slot-scope="scope">
          {{ scope.row.level ==0?"所有用户":"会员"+scope.row.level }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="330" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="editvideo(scope.row.videoId)">
            编辑
          </el-button>
          <el-button type="danger" size="mini" @click="delvideo(scope.row.videoId)"
                     v-show="scope.row.videoState.stateName == '已上架'">
            下架
          </el-button>
          <el-button type="primary" size="mini" @click="upvideo(scope.row.videoId)"
                     v-show="scope.row.videoState.stateName == '已下架'">
            上架
          </el-button>
          <el-button slot="reference" type="primary" size="mini" @click="openLevel(scope.row.videoId)">设置等级</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit"
                @pagination="getList"/>

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
    components: {Pagination},
    data() {
      return {
        video: {
          'videoId': null,
          'level':null
        },
        dialogVisible: false,
        videoName: '',
        total: 0,
        listQuery: {
          page: 1,
          limit: 5
        },
        list: [],
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
          url: 'http://localhost:8081/admin/searchVideo?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit + '&videoName=' + vm.videoName
        }).then(function (resp) {
          vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
          vm.list = resp.data.list
        })
      },
      getList() {
        var vm = this
        this.axios({
          method: 'GET',
          url: 'http://localhost:8081/admin/videoPageInfo?pageNum=' + vm.listQuery.page + '&pageSize=' + vm.listQuery.limit
        }).then(function (resp) {
          vm.total = resp.data.total // 讲pageInfo中的total放到vm的total
          vm.list = resp.data.list
        })
      },
      addvideo() {
        this.$router.push('/addvideo/index')
      },
      editvideo(id) {
        this.$router.push('/editvideo/index/' + id)
      },
      delvideo(id) {
        var vm = this
        this.$confirm('此操作将下架该视频, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          vm.axios({
            method: 'GET',
            url: 'http://localhost:8081/admin/rdeleteVideo/' + id
          }).then(function (resp) {
            if (resp.data === 'success') {
              vm.$message({
                message: '下架成功',
                type: 'success'
              })
              vm.getList()
            }
            // eslint-disable-next-line handle-callback-err
          }).catch(function (error) {
            vm.$message.error('下架失败')
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消下架'
          })
        })
      },
      upvideo(id) {
        var vm = this
        vm.axios({
          method: 'GET',
          url: 'http://localhost:8081/admin/upVideo/' + id
        }).then(function (resp) {
          if (resp.data === 'success') {
            vm.$message({
              message: '上架成功',
              type: 'success'
            })
            vm.getList()
          }
          // eslint-disable-next-line handle-callback-err
        }).catch(function (error) {
          vm.$message.error('上架失败')
        })
      },
      // 获取用户列表
      fetchData() {
        var vm = this
        this.axios({
          method: 'GET',
          url: 'http://localhost:8081/admin/list'
        }).then(function (resp) {
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
        vm.video.level=vm.option,
        this.axios({
          method: 'POST',
          data: vm.video,
          url: 'http://localhost:8081/video/updateLevel'
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
        this.video.videoId = vid
      }
    }
  }
</script>
