var url = require('url');
var myUrl = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%B0%94';
var myUrl = new url.URL(myUrl);
console.log(myUrl.origin);
console.log(myUrl.pathname);
console.log(myUrl.searchParams.get('query'));
for(var key of myUrl.searchParams.keys())
    console.log(key, myUrl.searchParams.get(key));