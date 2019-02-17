import vue from 'vue'
import vuex from 'vuex'
import axios from "axios";
import api from '../apiconfig'

vue.use(vuex);

export default new vuex.Store({
    state: {
        landingInfo: {    //登陆信息
            states: false,  //登陆状态
            username: '',
            loginTime: '',
            loadingMode: '',
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
        //改变登陆状态
        landingChenge(state,info){
            state.landingInfo  = info;
        },
        //初始化获取信息
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
        }
    }
});