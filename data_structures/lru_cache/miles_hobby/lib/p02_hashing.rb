class Fixnum
  # Fixnum#hash already implemented for you
  Fixnum.hash
end

class Array
  def hash
    num = 0
    self.each_with_index do |el, i|
      el = el.hash if el.is_a?(Array)
      num = num ^ (el.ord * (i + 1))
    end
    num.hash
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each do |key, val|
      num = num ^ (val.hash * key.hash)
    end
    num
  end
end
