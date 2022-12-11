<template>
  <div class="dashboard-editor-container">
    <github-corner class="github-corner"/>

    <panel-group @handleSetLineChartData="handleSetLineChartData"/>

    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <line-chart :chart-data="lineChartData"/>
    </el-row>
<!--    <p style="color: red"><b>PS:横坐标视频标题按照点评值降序</b></p>-->
  </div>
</template>

<script>
import GithubCorner from '@/components/GithubCorner'
import LineChart from './components/LineChart'

function sortNumber(a, b) {
  return b - a
}

const lineChartData = {
  newVisitis: {
    expectedData: [1, 5, 10, 20, 30, 50, 100],
    actualData: [1, 5, 10, 20, 30, 50, 100]
  }
}
export default {
  name: 'DashboardAdmin',
  components: {
    GithubCorner,
    LineChart
  },
  data() {
    return {
      lineChartData: lineChartData.newVisitis
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    handleSetLineChartData(type) {
      this.lineChartData = lineChartData[type]
    },
    fetchData() {
      var vm = this
      this.axios({
        method: 'GET',
        url: 'http://localhost:8081/voteLog/getData?id=' + this.$route.params.id
      }).then(function(resp) {
        var temp = []
        for (var i = 0; i < resp.data.length; i++) {
          temp.push(parseInt(resp.data[i]))
        }
        temp.sort(sortNumber)
        vm.lineChartData.actualData = resp.data
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .github-corner {
    position: absolute;
    top: 0px;
    border: 0;
    right: 0;
  }

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
