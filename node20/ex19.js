var fs = require('fs');
var ws = fs.WriteStream('ex18.txt');
ws.write('한 번 작성\n');
ws.write('또 작성');
ws.close();