var mysql = require('mysql');

var express = require('express');
var app = express();

var path = require('path');
app.use(express.static(path.resolve(__dirname, '../public')));
app.set('views', path.resolve(__dirname, '../views'));
app.set('view engine', 'ejs');
app.use(express.json(), express.urlencoded({extended:false}));

var emp = require('./routers/emp');
var dept = require('./routers/dept');

// cb를 호출하여 넘어갈 수 있도록 함
app.use('/emp', emp);
app.use('/dept', dept);

app.listen(3000, function(){
    console.log('server starting...');
});