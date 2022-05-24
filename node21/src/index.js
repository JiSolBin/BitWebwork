var path = require('path');
var express = require('express');

var app = express();

// static 파일
// 이 코드가 app.get 아래로 가면 get부터 실행돼서 index.html 안뜸
// static은 우선순위를 가장 높게 주는게 좋음
app.use(express.static(path.resolve(__dirname, '../public')));
// view 있는 곳
app.set('views', path.resolve(__dirname, '../views'));
// view engine = ejs
app.set('view engine', 'ejs');
// json값 가져오기 (emp.ejs line 30)
app.use(express.json());
// post form 값 받아오기
app.use(express.urlencoded({extended:false}));

app.get('/emp/list', function (req, res) {

    // 페이징
    var p = req.query.p!=undefined?parseInt(req.query.p):1;

    // db 정보
    var mysql = require('mysql');
    var conn = mysql.createConnection({
      host: "localhost",
      user: "user01",
      password: "1234",
      database: "scott"
    });
    
    // mysql 연결
    conn.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
    });

    // 쿼리문 실행
    var tot;
    conn.query('select count(*) as "tot" from emp', function(err, result){
        tot = result[0].tot;
    });
    conn.query('select * from emp limit '+(p-1)*5+', 5', function (error, results, fields) {
        if (error) throw error;
        res.render('emplist', {arr: results, total: tot});
    });

    conn.end();

    // data render
    // res.render('emplist', {arr: [{empno:1111, ename:'tester1', sal:1000}, {empno:2222, ename:'tester2', sal:2000}]});
});

app.get('/emp/add', function(req,res){
    res.render('empadd', {obj:null});
});

app.post('/emp/add', function(req,res){

    var mysql = require('mysql');

    var conn = mysql.createConnection({
        host: "localhost",
        user: "user01",
        password: "1234",
        database: "scott"
    });

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        // var sql = "INSERT INTO emp (empno, ename, sal, hiredate) VALUES ("+req.body.empno+",'"+req.body.ename+"',"+req.body.sal+",now())";
        // prepareStatement 사용 -> con.query에 배열 추가
        var sql = "insert into emp (empno, ename, sal, hiredate) values (?,?,?,now())";
        conn.query(sql, [req.body.empno, req.body.ename, req.body.sal], function (err, result) {
            if (err) {
                res.render('empadd', {obj:req.body});
                return; // 안해주면 css 안먹힘 -> why?
            }
            console.log('insert', result);
            res.redirect('list');
        });
    });
});

app.get('/emp/row', function(req, res){
    var mysql = require('mysql');

    var conn = mysql.createConnection({
        host: "localhost",
        user: "user01",
        password: "1234",
        database: "scott"
    });

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        conn.query('select empno as "empno", ename as "ename", sal as "sal" from emp where empno = ?', [parseInt(req.query.empno)], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.render("emp", {bean: result[0]});
        });
    });
});

app.post('/emp/row', function(req,res){
    var mysql = require('mysql');

    var conn = mysql.createConnection({
        host: "localhost",
        user: "user01",
        password: "1234",
        database: "scott"
    });

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        var sql = 'update emp set ename=?, sal=? where empno=?';
        conn.query(sql, [req.body.ename, req.body.sal, req.body.empno], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.redirect('list');
        });
    });
});

app.post('/emp/delete', function(req,res){
    var mysql = require('mysql');

    var conn = mysql.createConnection({
      host: "localhost",
      user: "user01",
      password: "1234",
      database: "scott"
    });
    
    conn.connect(function(err) {
      if (err) throw err;
      var sql = "DELETE FROM emp WHERE empno = ?";
      conn.query(sql, [req.body.empno], function (err, result) {
        if (err) throw err;
        console.log("Number of records deleted: " + result.affectedRows);
        // 이전에도 이거 해주면 더 좋음!!
        if(result.affectedRows>0) res.statusCode = 200;
        else res.statusCode = 500;
        res.end();
      });
    });
});

app.listen(3000, function(){
    console.log('server starting...');
});