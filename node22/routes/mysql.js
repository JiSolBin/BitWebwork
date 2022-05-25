let express = require('express');
let router = express.Router();
let pool = require('../modules/mysql');

router.get('/', function(req,res){
    pool.query('SELECT * from emp', function (error, results, fields) {
        if (error) throw error;
        res.render('mysql/list', {list:results});

        // pool.query()는 getConnection()과 query, 커넥션 release가 포함되어 있음
        // 반납 (end 아님! end는 접속을 끊는 것)
        // conn.release();
    });
});

router.post('/', function(req,res){
    // pool.query('insert into emp (empno, ename, sal) values (?,?,?)'
    //     ,[req.body.empno, req.body.ename, req.body.sal]
    //     ,function(err, result){
    //         res.redirect('./');
    //     }
    // );

    // Transactions
    // 우리 예제엔 트랜잭션이 크게 필요 없음
    // ex) insert가 두 개 이상일 경우 하나라도 실패하면 rollback 해야함
    pool.getConnection(function(err, conn){
        conn.beginTransaction(function(err){
            conn.query('insert into emp (empno, ename, sal) values (?,?,?)'
                ,[req.body.empno, req.body.ename, req.body.sal]
                ,function(err, result){
                    if(err){
                        return conn.rollback(function(){
                            throw err;
                        });
                    }
                    conn.commit();
                    res.redirect('./');
                    conn.release();
                }
            );
        });
    });
});

module.exports = router;