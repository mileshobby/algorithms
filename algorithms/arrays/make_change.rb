def make_change(amt, coins)
  return nil if amt < 0 || coins.empty?
  return [] if amt == 0
  coins.sort.reverse
  solutions = []
  coins.each_with_index do |big_coin, i|
    if amt >= big_coin
      this_solution = make_change(amt - big_coin, coins[i..-1])
      unless this_solution.nil?
        this_solution << big_coin
        solutions << this_solution
      end
    end
  end
  p solutions if amt == 16
  solutions.min_by {|sol| sol.length}
end

p make_change(16, [6, 5, 1])
