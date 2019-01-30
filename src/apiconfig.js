const url = 'http://localhost/php/';  //本地测试
const api = {
    classifiesQueryAll: url  + 'classifies/queryAll/',
    elementsQueryAll: url  + 'elements/queryAll/',
    administerQueryName: url  + 'administer/queryname/',
    elementsHaveType: url  + 'elements/haveType/',
    classifiesDeleteOne: url  + 'classifies/deleteOne/',
    classifiesAddOne: url  + 'classifies/addOne/',
    classifiesUpdate: url  + 'classifies/update/',
    elementsDeleteOne: url  + 'elements/deleteOne/',
    elementsAddOne: url  + 'elements/addOne/',
    elementsUpdate: url  + 'elements/update/',
} 

export default api;