var mysql = require('mysql');
var my = require('../mymodule/bitmysql');

var express = require('express');
var router = express.Router();

// 리스트
router.get('/list', function (req, res) {

    // 페이징
    var p = req.query.p!=undefined?parseInt(req.query.p):1;

    // db 정보
    var conn = mysql.createConnection(my);
    
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

    conn.end(); // db연결과 쿼리문 실행이 따로 있어서 여기 있어도 end(close) 잘함
});

// 추가
router.get('/add', function(req,res){
    res.render('empadd', {obj:null});
});

router.post('/add', function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        var sql = "insert into emp (empno, ename, sal, hiredate) values (?,?,?,now())";
        conn.query(sql, [req.body.empno, req.body.ename, req.body.sal], function (err, result) {
            if (err) {
                res.render('empadd', {obj:req.body});
                return;
            }
            console.log('insert', result);
            res.redirect('list');
            conn.end();  // db연결과 쿼리문 실행이 같이 있어서 여기서 end 해줘야함 -> 비동기
        });
    });
});

// 디테일
router.get('/row', function(req, res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        conn.query('select empno as "empno", ename as "ename", sal as "sal" from emp where empno = ?', [parseInt(req.query.empno)], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.render("emp", {bean: result[0]});
            conn.end();
        });
    });
});

// 수정
router.post('/row', function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        var sql = 'update emp set ename=?, sal=? where empno=?';
        conn.query(sql, [req.body.ename, req.body.sal, req.body.empno], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.redirect('list');
            conn.end();
        });
    });
});

// 삭제
router.post('/delete', function(req,res){

    var conn = mysql.createConnection(my);
    
    conn.connect(function(err) {
      if (err) throw err;
      var sql = "DELETE FROM emp WHERE empno = ?";
      conn.query(sql, [req.body.empno], function (err, result) {
        if (err) throw err;
        console.log("Number of records deleted: " + result.affectedRows);
        if(result.affectedRows>0) res.statusCode = 200;
        else res.statusCode = 500;
        res.end();
        conn.end();
      });
    });
});

module.exports = router;