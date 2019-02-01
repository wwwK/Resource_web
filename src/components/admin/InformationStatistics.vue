<template>
    <div class="ss">
        <div id="echarts">
            
        </div>
    </div>
</template>

<script>
export default {
  data: () => ({
    ClassfiyStatistics:{   //统计类型名和对应的元素数量
      type:[],
      value:[],
    }
  }),
  mounted: function() {
    this.getData();
  },
  methods: {
    drawLine() {
      var dom = document.getElementById("echarts");
      let myChart = this.$echarts.init(dom);
      var option = {
        color: ["#3398DB"],
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "shadow" // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: [
          {
            type: "category",
            data: this.ClassfiyStatistics.type,
            axisTick: {
              alignWithLabel: true
            }
          }
        ],
        yAxis: [
          {
            type: "value"
          }
        ],
        series: [
          {
            name: "元素数量",
            type: "bar",
            barWidth: "40%",
            data: this.ClassfiyStatistics.value
          }
        ]
      };

      myChart.setOption(option);
    },
    getData(){
      this.$.ajax({
        type: this.api.everyClassNum.type,
        url: this.api.everyClassNum.url,
        data:{},
        success:(res)=>{
          res = JSON.parse(res)
          for (const key in res) {
            this.ClassfiyStatistics.type.push(key);
            this.ClassfiyStatistics.value.push(res[key] || 0);
          }
          console.log(this.ClassfiyStatistics);
          this.drawLine();
        },
        error:(err)=>{
          console.log(err)
        }
      })
    }
  }
};
</script>

<style lang="stylus" scoped>
#echarts {
  height: 300px;
  width: 800px;
}
</style>

