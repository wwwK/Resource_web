const url = 'http://localhost/resources/'; //本地测试
const api = {
    administerQueryName: {      //验证用户登录
        url: url + 'loading/loginByUsername/',
        type: 'POST'
    },
    loginByPhone:{
        url: url + 'loading/loginByPhone/', //短信验证
        type: 'GET'
    },
    savelandingRecord:{
        url: url + 'loading/insterlandingrecord/', //登陆记录
        type: 'GET'
    },
    classifiesQueryAll: {    //查询所有类型
        url: url + 'classifies/queryAll/',
        type: 'POST'
    },
    elementsQueryAll: {       //查询所有元素
        url: url + 'elements/queryAll/',
        type: 'POST'
    },
    elementsHaveType: {        //查询所有元素所涉及到的类型
        url: url + 'elements/haveType/',
        type: 'POST'
    },
    classifiesDeleteOne: {      //删除一个类型
        url: url + 'classifies/deleteOne/',
        type: 'GET'
    },
    classifiesAddOne: {       //添加一个类型
        url: url + 'classifies/addOne/',
        type: 'POST'
    },
    classifiesUpdate: {        //修改更新类型
        url: url + 'classifies/update/',
        type: 'POST'
    },
    elementsDeleteOne: {     //删除一个元素
        url: url + 'elements/deleteOne/',
        type: 'GET'
    },
    elementsAddOne: {      //添加一个元素
        url: url + 'elements/addOne/',
        type: 'POST'
    },
    elementsUpdate: {      //更新修改元素
        url: url + 'elements/update/',
        type: 'POST'
    },
    everyClassNum:{
        url: url + 'classifies/eachNumber/', //每个类型所含的元素数量
        type: 'GET'
    },
    browserinsert:{
        url: url + 'browser/insert/', //记录访问信息
        type: 'POST'
    },
    browserSelect:{
        url: url + 'browser/query/', //查询所有访问信息
        type: 'POST'
    },
    
}

export default api;