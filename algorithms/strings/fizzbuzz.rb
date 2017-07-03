def fizzbuzz
  a = []
  0.upto(100) do |n|
    if n%5==0 && n%3==0
      a << "fizzbuzz"
    elsif n%5 == 0
      a << "buzz"
    elsif n%3 == 0
      a << "fizz"
    else
      a << n
    end
  end
  a
end

p fizzbuzz
