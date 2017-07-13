require 'byebug'
def can_jump(arr)
    # return true if arr.length <= 1
    # return false if arr[0] == 0
    # possibilities = (1..arr[0])
    # possibilities.each do |step|
    #     return true if can_jump(arr[step..-1])
    # end
    # false
    jump = Jumper.new(arr)
    jump.can_jump?

end

class Jumper
    def initialize(arr)
        @arr = arr
        @jump_cache = {}
    end

    def can_jump?(i = 0)
        return true if i >= @arr.length - 1
        return false if @arr[i] == 0
        return @jump_cache[i] unless @jump_cache[i].nil?
        possibilities = (i + 1..i + @arr[i]).to_a
        possibilities.each do |step|
            return true if can_jump?(step)
        end
        @jump_cache[i] = false
        false
    end


end


p can_jump([3,2,1,0,4])
