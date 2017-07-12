Function.prototype.curry = function curry(numArgs){
  let args = [];
  const curried = (arg) => {
    args.push(arg);
    if(args.length === numArgs){
      return this(...args);
    }
    else{
      return curried;
    }
  };
  return curried;
};

const sum = function(a, b, c){
  return a + b + c;
};

let x = sum.curry(3);
console.log(x);
x = x(3)(4)(2);
console.log( x );
