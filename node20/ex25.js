var express = require('express');
var app = express();

// 정적파일사용
app.use(express.static('static'));
// 클라이언트로 부터 받은 http 요청 메시지 형식에서 body데이터를 해석하기 위해 작성
app.use(express.json()); // json으로 이루어진 Request Body 파싱
app.use(express.urlencoded({extended:true})); // form-> x-www-form-urlencoded 데이터 파싱

app.set('views', './views');
// app.set('view engine', 'pug');
app.set('view engine', 'ejs');

app.get('/', function(req,res){
    res.render('index', {title:'HeyEjs', message: 'Hello there!'});
});

app.post('/add.html', function(req, res){
    console.log(req.body);
    res.setHeader('Content-Type', 'text/html; charset=utf-8');
    res.end('<h1>새로운 페이지</h1>');
});

app.listen(7070, function(){
    console.log('service run...');
});