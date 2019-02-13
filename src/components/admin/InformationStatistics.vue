<template>
    <div class="ss" id="wrapper">
        <div id="Classfiy"></div>
        <div id="Browse"></div>
    </div>
</template>

<script>
export default {
  data: () => ({
    browser: {}
  }),
  mounted: function() {
    this.getData();
    this.drawLine();
  },
  computed:{
    ClassfiyStatistics(){
      return this.$store.state.ClassfiyStatistics;
    }
  },
  methods: {
    getData() {
      this.$.ajax({
        type: this.api.browserSelect.type,
        url: this.api.browserSelect.url,
        data: {},
        success: res => {
          this.browser = JSON.parse(res);
          this.Browsevolume();
        },
        error: err => {
          console.log(err);
        }
      });
    },
    //浏览次数统计
    Browsevolume() {
      var dom = document.getElementById("Browse");
      let myChart = this.$echarts.init(dom);
      var data = this.getVirtulData(2019);
      var maxdata = data.sort((a, b) => {
        return b[1] - a[1];
      })[0]; //得到最大值

      var option = {
        backgroundColor: "#404a59",

        title: {
          top: 30,
          text: "浏览量统计",
          subtext: "网站每日浏览量",
          left: "center",
          textStyle: {
            color: "#fff"
          }
        },
        legend: {
          top: "30",
          left: "100",
          data: ["浏览量", "Top 3"],
          textStyle: {
            color: "#fff"
          }
        },
        calendar: [
          {
            top: 100,
            left: "center",
            cellSize: 23,
            range: ["2019-01-01", "2019-6-30"],
            splitLine: {
              //整个日历样式
              show: true,
              lineStyle: {
                color: "#000",
                width: 3,
                type: "solid"
              }
            },
            yearLabel: {
              //年份字的样式
              formatter: "{start} 上半年",
              textStyle: {
                color: "#fff"
              }
            },
            itemStyle: {
              //设置日历格的样式
              normal: {
                color: "#323c48",
                borderWidth: 1,
                borderColor: "#111"
              }
            }
          }
        ],
        tooltip: {
          formatter: params => {
            return `${params.data[0]}<br />${params.marker}浏览量：${
              params.data[1]
            }次<br />${params.marker}全年排名：${params.dataIndex + 1}`;
          },
          backgroundColor: "rgba(100,100,100,0.5)",
          borderColor: "rgba(100,100,100,0.1)",
          borderWidth: 2
        },
        visualMap: {
          //视觉映射组件
          min: 0,
          max: maxdata[1],
          type: "continuous",
          itemHeight:160,
          range: [0, maxdata[1]],
          calculable: true,
          align: "left",
          text: ["High", "Low"],
          right: 60,
          top: 72,
          inRange: {
            color: ["rgb(221,185,38)", "rgb(221,185,38)", "rgb(194,53,49)"]
          },
          textStyle: {
            color: "#fff"
          }
        },
        series: [
          //系列列表。每个系列通过 type 决定自己的图表类型
          {
            name: "浏览量",
            type: "scatter",
            coordinateSystem: "calendar",
            data: data,
            symbolSize: function(val) {
              return Math.floor((val[1] * 18) / (maxdata[1] + 5)) + 5;
            },
            itemStyle: {
              normal: {
                color: "#ddb926"
              }
            }
          },
          {
            name: "Top 3",
            type: "heatmap",
            coordinateSystem: "calendar",
            data: data
              .sort(function(a, b) {
                return b[1] - a[1];
              })
              .slice(0, 3),
            symbolSize: function(val) {
              return Math.floor((val[1] * 18) / maxdata[1]);
            },
            showEffectOn: "render", //何时显示特效
            rippleEffect: {
              brushType: "stroke" //波纹的绘制方式
            },
            hoverAnimation: true,
            itemStyle: {
              normal: {
                // color: "#f4e925",
                shadowBlur: 10,
                shadowColor: "#333"
              }
            },
            zlevel: 1
          }
        ],
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            restore: { show: true },
            saveAsImage: { show: true }
          },
          right: 30,
        }
      };

      myChart.setOption(option);
    },
    getVirtulData() {
      var time = {};
      for (var i = 0; i < this.browser.length; i++) {
        var date = this.browser[i].created_at.split(" ")[0];
        time[date] ? time[date]++ : (time[date] = 1);
      }
      var data = [];
      for (const date in time) {
        data.push([date, time[date]]);
      }
      return data;
    },
    drawLine() {
      var dom = document.getElementById("Classfiy");
      var myChart = this.$echarts.init(dom);
      var Classfiyoption = {
        title: {
          text: "资源数量表",
          subtext: "每个类型的资源数量",
          left: "center"
        },
        color: ["#3398DB"],
        tooltip: {
          //提示框组件
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
            name: "类型",
            type: "category",
            data: this.ClassfiyStatistics.type,
            axisTick: {
              alignWithLabel: true,
              interval: 0
            },
            axisLabel: {
              //坐标轴刻度标签的相关设置。
              interval: 0,
              rotate: -30,
              color: "#222",
              fontSize: 13
            }
          }
        ],
        yAxis: [
          {
            name: "数量",
            type: "value"
          }
        ],
        series: [
          {
            name: "元素数量",
            type: "bar",
            barWidth: "40%",
            data: this.ClassfiyStatistics.value,
            itemStyle: {
              //柱状图设置
              barBorderRadius: [5, 5, 0, 0],
              opacity: 0.8
            },
            emphasis: {
              //高亮的图形样式和标签样式。
              label: {
                show: true
              },
              itemStyle: {
                color: "green"
              }
            },
            markPoint: {
              //图表标注。
            },
            markLine: {
              data: [
                {
                  name: "最大值",
                  // 支持 'average', 'min', 'max'
                  type: "max"
                }
              ],
              lineStyle: {
                color: {
                  type: "linear",
                  x: 0,
                  y: 0,
                  x2: 1,
                  y2: 1,
                  colorStops: [
                    {
                      offset: 0,
                      color: "red" // 0% 处的颜色
                    },
                    {
                      offset: 1,
                      color: "blue" // 100% 处的颜色
                    }
                  ],
                  global: false // 缺省为 false
                }
              }
            }
          }
        ],
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            magicType: { show: true, type: ["line", "bar"] },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        }
      };
      myChart.setOption(Classfiyoption);
    }
  }
};
</script>

<style lang="stylus" scoped>
#Classfiy, #Browse {
  height: 350px;
  width: 1100px;
}
</style>

