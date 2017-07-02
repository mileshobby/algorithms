def compress(str)
  return str if str.length < 3
  new_str  = []
  i = 0
  while i < str.length - 1
    char = str[i]
    count = 1
    until char != str[i + 1]
      count += 1
      i += 1
    end
    new_str << "#{char}#{count}"
    i += 1
  end
  new_str = new_str.join('')
  new_str.length < str.length ? new_str : str
end

p compress("abcdef")
