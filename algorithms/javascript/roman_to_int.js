var romanToInt = function(s) {
    const conversions = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000 }
    let int = 0;
    let currentMax = 1;
    for(let i = s.length - 1; i >= 0; i--){
        const thisNum = conversions[s[i]];
        if(thisNum > currentMax){
            currentMax = thisNum;
            int += thisNum;
        }
        else if(thisNum < currentMax){
            int -= thisNum;
        }
        else int += thisNum;
    }
    return int;
};
