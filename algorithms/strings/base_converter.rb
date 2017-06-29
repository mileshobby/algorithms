def base_converter(num_string, b1, b2)
  base10 = 0
  num_string.reverse.chars.each_with_index do |digit, i|
    base10 += digit.to_i * (b1**i)
  end
  base2 = ""
  until base10 == 0
    base2 = (base10 % b2).to_s + base2
    base10 /= b2
  end
  base2
end

p base_converter("101", 2, 3 )
