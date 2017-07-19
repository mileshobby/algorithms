var nextPermutation = function(nums) {
    for(let i = nums.length - 1; i > 0; i --){
        if(nums[i] > nums[i - 1]){
            console.log(nums);
            let closest = i;
            let j = i + 1;
            while(j < nums.length){
                if(nums[j] <= nums[closest] && nums[j] > nums[i - 1]){
                    closest = j;
                }
                j += 1;
            }
            let temp = nums[closest];
            nums[closest] = nums[i - 1];
            nums[i - 1] = temp;
            let k = i;
            console.log(nums);
            j = nums.length - 1;
            while(k < j){
                temp = nums[k];
                nums[k] = nums[j];
                nums[j] = temp;
                k++;
                j--;
            }
            return;
        }
    }
    nums = nums.sort((a,b) => {
      if(a < b){
        return -1;
      }
      else if (b > a){
        return 1;
      }
      else{
        return 0;
      }
    });
};
let x = [2,3,1];
nextPermutation(x);
console.log(x);
