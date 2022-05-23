var callback1 = function(){
    console.log('실행');
};

// 비동기 통신
console.log('main start...');
var t3 = setTimeout(callback1, 3000);
console.log('main end...');
// clearTimeout(t3);

// 바로 실행
var call1 = setImmediate(callback1);
// 이렇게 쓰면 안됨. setImmediate 사용
setTimeout(function(){
    console.log('0실행')
}, 0);