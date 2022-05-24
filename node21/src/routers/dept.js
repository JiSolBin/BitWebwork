var express = require('express');
var router = express.Router();
var mongo = require('mongodb');

router.get('/list', function(req, res){
    var MongoClient = mongo.MongoClient;
    var url = "mongodb://localhost:27017/";

    MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("testDB");
    var coll = dbo.collection("emp");

    // 페이징
    var p = req.query.p!=undefined?parseInt(req.query.p):1;
    var tot;
    coll.find({}).toArray(function(err, result){tot=result.length;})

    var cur = coll.find({}).skip((p-1)*5).limit(5);
    cur.toArray(function(err, result) {
        if (err) throw err;
        res.render('dept/list', {total:tot, arr:result});
        db.close();
      });
    });
});

router.get('/add', function(req,res){
    res.render('dept/add');
});

router.post('/add', function(req,res){
    var MongoClient = mongo.MongoClient;
    var url = "mongodb://localhost:27017/";
    
    MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db("testDB");
      var myobj = { empno:req.body.empno, ename:req.body.ename, sal:req.body.sal};
      dbo.collection("emp").insertOne(myobj, function(err, result) {
        if (err) throw err;
        console.log("1 document inserted");
        db.close();
        res.redirect('list'); // router.get('/list') <-> res.render('dept/emp', ~) (ejs)
      });
    });
});

router.get('/row', function(req, res){
    var param = req.query._id;

    var MongoClient = mongo.MongoClient;
    var url = "mongodb://localhost:27017/";

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("testDB");
        dbo.collection("emp").findOne({_id:new mongo.ObjectId(param)}, function(err, result) {
            if (err) throw err;
            console.log(result);
            db.close();
            res.render('dept/emp',{bean:result});
        });
    });
});

router.post('/row', function(req,res){
    var MongoClient = mongo.MongoClient;
    var url = "mongodb://127.0.0.1:27017/";

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("testDB");
        var myquery = { _id: new mongo.ObjectId(req.body._id) }; // 조건
        var newvalues = { $set: { empno: parseInt(req.body.empno), ename: req.body.ename } };
        if(req.body.sal)
            newvalues['$set'].sal = parseInt(req.body.sal);
        dbo.collection("emp").updateOne(myquery, newvalues, function(err, result) {
            if (err) throw err;
            console.log("1 document updated");
            db.close();
        });
    });

    res.redirect("list");
});

router.post('/delete', function(req, res){
    var MongoClient = mongo.MongoClient;
    var url = "mongodb://localhost:27017/";

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("testDB");
        var myquery = { _id: new mongo.ObjectId(req.body._id) };
        dbo.collection("emp").deleteOne(myquery, function(err, obj) {
            if (err) throw err;
            console.log("1 document deleted");
            db.close();
            res.end();
        });
    });
});

module.exports = router;