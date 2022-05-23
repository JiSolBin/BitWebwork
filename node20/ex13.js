var path = require('path');
console.log(path.sep, path.delimiter);
console.log(path.resolve(__filename));
var msg = 'C:\\windows\\..\\BitWebwork\\.\\node20';
console.log(path.resolve(msg));
// path 객체로 만듦
console.log(path.parse(msg));
// 다시 문자열로 만듦
console.log(path.format(path.parse(msg)));
// 절대경로인지 아닌지
console.log(path.isAbsolute(msg));
console.log(path.basename(msg));
console.log(path.dirname(msg));
console.log(path.extname(msg));
console.log(path.relative(msg, 'c:\\'));