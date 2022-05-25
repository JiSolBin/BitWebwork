var mongoose = require('mongoose'); // 1. mongoose 모듈 가져오기
mongoose.connect('mongodb://localhost:27017/testDB'); // 2. testDB 세팅
var db = mongoose.connection; // 3. 연결된 testDB 사용

var emp = mongoose.Schema({ // 6. Schema 생성
    empno : 'number',
    ename : 'string',
    sal : 'number'
});

// 7. 정의된 스키마를 객체처럼 사용할 수 있도록 model() 함수로 컴파일
// emp 있으면 emp 쓰고, 없으면 emp로 만들기
var Emp = mongoose.model('emp', emp, 'emp');

module.exports = Emp;