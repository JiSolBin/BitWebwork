// module.exports vs exports
// module.exports는 단 한 번만 실행할 수 있음

// 모조리 exports
exports.msg1 = 'aaaaa';
exports.msg2 = 'bbbbb';
// exports.func03 = function(){console.log();};

// msg2만 export
// module.exports = {msg1:'cccc'};
// module.exports = {msg2:'dddd'};

// var obj1 = 1111;
// module.exports = obj1;
// exports.obj1; -> exports는 key-value 형태로 exports 해줘야함
// exports.a = obj1;