var nextPermutation = function(nums) {
    for(let i = nums.length - 1; i > 0; i --){
        if(nums[i] > nums[i - 1]){
            let closest = i;
            let j = i + 1;
            while(j < nums.length){
                if(nums[j] < nums[closest]){
                    closest = j;
                }
                j += 1;
            }
            let temp = nums[closest];
            nums[closest] = nums[i - 1];
            nums[i - 1] = temp;
            let k = i;
            j = nums.length - 1;
            while(k < j){
                console.log('hi');
                temp = nums[k];
                nums[k] = nums[j];
                nums[j] = temp;
                k++;
                j--;
            }
            return;
        }
    }
    nums = nums.sort();
};
let x = [5, 4, 6, 1, 2];
nextPermutation(x);
console.log(x);
