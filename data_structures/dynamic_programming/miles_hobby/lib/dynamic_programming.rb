require 'byebug'

class DynamicProgramming
  def initialize
    @blaire_cache = {1=>1, 2=>2}
    @frog_cache = {1=>[[1]]}
    @visiting = {}
    @hop_cache = { 1=>[[1]], 2=>[[1,1],[2]],
                  3=>[[1, 1, 1], [1, 2], [2, 1], [3]] }
  end

  def blair_nums(n)
    return @blaire_cache[n] if @blaire_cache[n]
    val = blair_nums(n - 1) + blair_nums(n - 2) + ((n * 2) - 1)
    @blaire_cache[n] = val
    val

  end

  def frog_hops(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    frog_cache = { 1=>[[1]], 2=>[[1,1],[2]],
                  3=>[[1, 1, 1], [1, 2], [2, 1], [3]] }
    4.upto(n) do |i|
      n1 = frog_cache[i-1].map {|steps| steps + [1]}
      n2 = frog_cache[i-2].map {|steps| steps + [2]}
      n3 = frog_cache[i-3].map {|steps| steps + [3]}
      nth = n1 + n2 + n3
      frog_cache[i] = nth
    end

    frog_cache
  end

  def frog_hops_top_down(n)
    return @hop_cache[n] if @hop_cache[n]
      n1 = frog_hops_top_down(n-1).map {|steps| steps + [1]}
      n2 = frog_hops_top_down(n-2).map {|steps| steps + [2]}
      n3 = frog_hops_top_down(n-3).map {|steps| steps + [3]}
      @hop_cache[n] = n1 + n2 + n3
    @hop_cache[n]
  end

  def reset_frog_cache
    @frog_cache = {1=>[[1]]}
  end

  def super_frog_hops(n, k)
    #to account for trying switching to different k value
    unless @frog_cache["#{k}"]
      reset_frog_cache
      @frog_cache["#{k}"]=true
    end
    #base case
    return @frog_cache[n] if @frog_cache[n]
    moves = []
    1.upto(k) do |i|
      if n - i > 0
        moves.concat super_frog_hops(n - i, k).map {|steps| steps + [i]}
      end
    end
    # if we can move up n steps,that add that as a possibility
    if n <= k
      moves << [n]
    end
    @frog_cache[n] = moves
    moves
  end

  def make_change(amt, coins)
    coins.sort!.reverse!
    return [] if amt == 0
    return nil if coins.empty? || coins[-1] > amt
    solns = []
    coins.each_with_index do |big_coin, i|
      next_amt = amt
      if big_coin <= amt
        next_amt -= big_coin
        soln = make_change(next_amt, coins[0..-1])
        solns << [big_coin] + soln if soln
      end
    end
    soln = solns.min { |soln| soln.length }
    soln.nil? ? nil : soln.sort

  end

  def maze_solver(maze, start_pos, end_pos)
    populate_maze_cache(maze, end_pos)
    solve_maze(maze, start_pos, end_pos)
  end

  private

  def populate_maze_cache(maze, end_pos)
    @maze_cache = Array.new(maze.length) { Array.new(maze[0].length)}
    @maze_cache[end_pos[0]][end_pos[1]] = end_pos
  end

  def solve_maze(maze, start_pos, end_pos)
    return [@maze_cache[start_pos[0]][start_pos[1]]] unless @maze_cache[start_pos[0]][start_pos[1]].nil?
    @visiting[start_pos] = true
    next_coords = [[start_pos[0]+1, start_pos[1]],
             [start_pos[0]-1, start_pos[1]],
             [start_pos[0], start_pos[1]+1],
             [start_pos[0], start_pos[1]-1]]
    next_coords = next_coords.reject do |coord|
      square = maze[coord[0]][coord[1]]
      square == nil || square == "X" || @visiting[coord]
    end
    paths = next_coords.map do |coord|
      solve_maze(maze, coord, end_pos)
    end
    paths.reject! { |path| path == nil}
    best_path = paths.empty? ? nil : paths.min { |path| path.length }
    @maze_cache[start_pos[0]][start_pos[1]] = best_path.nil? ? nil : best_path[0]
    @visiting[start_pos] = false
    best_path.nil? ? nil : [start_pos] + best_path
  end

end
