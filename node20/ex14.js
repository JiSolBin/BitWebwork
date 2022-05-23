var url = require('url');
var querystring = require('querystring');
var myUrl = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%B0%94';
console.log(url.parse(myUrl));
console.log(url.parse(myUrl).pathname);
console.log(url.parse(myUrl).query);
// 객체로 받아볼 수 있음 (ex15는 string)
var q = querystring.parse(url.parse(myUrl).query);
console.log(q.where, q.query);
console.log(querystring.stringify(q));