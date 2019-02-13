import vue from 'vue'
import vuex from 'vuex'
import axios from "axios";
import $ from 'jquery'
import api from '../apiconfig'


vue.use(vuex);

export default new vuex.Store({
    state: {
        landingInfo: {    //登陆信息
            states: false,  //登陆状态
            username: '',
            time: '',
        },
        haveoptions: [], //已存在子元素的类型
        elements: [], //所有子元素
        options: [], //所有类型
        ClassfiyStatistics: {  //统计类型名和对应的元素数量
            obj: {},
            type: [],
            value: []
        },
    },
    getters: {

    },
    mutations: {
        datainit(state) {
            //查询已有子元素的类型名~
            axios
                .get(api.elementsHaveType.url, {})
                .then(res => {
                    state.haveoptions = res.data.types;
                })
                .catch(err => {
                    console.log(err);
                });
            //获取所有资源元素
            axios
                .get(api.elementsQueryAll.url, {})
                .then(res => {
                    state.elements = res.data;
                })
                .catch(err => {
                    console.log(err);
                });
            //获取所有类型
            axios
                .get(api.classifiesQueryAll.url, {})
                .then(res => {
                    state.options = res.data;
                })
                .catch(err => {
                    console.log(err);
                });
            //获取浏览量统计信息
            $.ajax({
                type: api.everyClassNum.type,
                url: api.everyClassNum.url,
                data: {},
                success: res => {
                    res = JSON.parse(res);
                    state.ClassfiyStatistics.type = [];
                    state.ClassfiyStatistics.value = [];
                    state.ClassfiyStatistics.obj = res;
                    for (const key in res) {
                        state.ClassfiyStatistics.type.push(key);
                        state.ClassfiyStatistics.value.push(res[key] || 0);
                    }
                },
                error: err => {
                    console.log(err);
                }
            });
        }
    }
});