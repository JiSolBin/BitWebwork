var mysql = require('mysql');
var pool  = mysql.createPool({
    connectionLimit : 10, // 미리 만들어 놓을 커넥션 객체 숫자
    host            : 'localhost',
    user            : 'user01',
    password        : '1234',
    database        : 'scott'
});

module.exports = pool;