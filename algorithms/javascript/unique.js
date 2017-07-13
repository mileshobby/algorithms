Array.prototype.unique = function(){
    let found = {};
    let unique = [];
    this.forEach(el => {
        if(found[el]) return;
        found[el] = true;
        unique.push(el);
    });
    return unique;
};

console.log([1,2,3,3,2,5].unique());
