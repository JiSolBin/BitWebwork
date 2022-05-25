let express = require('express');
const Emp = require('../modules/mongoose');
let router = express.Router();

// 리스트
router.get('/', function(req, res){
    Emp.find(function(err, results){
        res.render('mongoose/list', {list:results});
    });
});

// 입력
router.get('/add.html', function(req, res){
    res.render('mongoose/add');
});

router.post('/', function(req, res){

    // 8. Emp 객체를 new 로 생성해서 값을 입력
    var newEmp = new Emp(req.body);

    // 9. 데이터 저장
    newEmp.save(function(){
        res.redirect('./');
    });
});

// 디테일
router.get('/:_id', function(req, res){
    Emp.findOne({_id:req.params._id}, function(error,result){
        res.render('mongoose/emp.ejs', {bean:result});
    });
});

// 수정
router.put('/:_id', function(req, res){
    Emp.findById({_id:req.params._id}, function(error,result){
        if(error){
            console.log(error);
        }else{
            result.ename = req.body.ename;
            result.sal = req.body.sal;
            result.save(function(){
                res.redirect('./');
            });
        }
    });
});

// 삭제
router.delete('/:_id', function(req, res){
    Emp.remove({_id:req.params._id}, function(error,output){
        res.redirect('./');
    });
});

module.exports = router;