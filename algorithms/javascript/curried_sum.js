function curried_sum(...args){
  if(args.length === 2) return args.reduce((sum, i) => sum + i, 0);
  return (num) => num + args[0];
}

console.log(curried_sum(5, 5));
let x = curried_sum(10);
console.log( x );
console.log(x(3));
