def longest_substring(str)
  longest = str[0]
  letters = {}
  start = 0
  fin = 1
  until fin == str.length
    if letters[str[fin]]
      longest = str[start..fin - 1] if (longest.length < (fin - start + 1))
      start = fin
      letters = {}
    end
    letters[str[fin]] = true
    fin += 1
  end
  fin -= 1
  longest = str[start..fin] if (longest.length < (fin - start + 1))
  longest
end

p longest_substring("abbccd")
