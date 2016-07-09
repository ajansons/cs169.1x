# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  total = 0
  arr.each { |n| total += n }
  total
end

def max_2_sum arr
  return arr[0] if arr.size == 1
  return 0 if arr.empty?
  
  largest, second_largest = -1.0 / 0
  
  arr.each do |n|
    if n > largest
     second_largest = largest
     largest = n
    elsif n > second_largest
      second_largest = n
    end
  end
  
  largest + second_largest
end

def sum_to_n? arr, n
  return false if arr.empty? or arr.size == 1
  arr.each_with_index { |elem_1, index_1| arr.each_with_index { |elem_2, index_2| return true if elem_1 + elem_2 == n and index_1 != index_2 } }
  return false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  !s.empty? and s[0] =~ /[b-df-hj-np-tv-z]/i
end

def binary_multiple_of_4? s
  return true if s =~ /^0+$/
  return false if (bin = s.to_i(2)) == 0
  bin % 4 == 0
end

# Part 3

class BookInStock
  
  def initialize(isbn, price)
    isbn.empty? ? raise(ArgumentError, 'ISBN cannot be empty') : @isbn = isbn
    price.to_f <= 0 ? raise(ArgumentError, 'Price cannt be zero or negative') : @price = price.to_f
  end
  
  def price_as_string
    '$' + "%.2f" % @price
  end
  
  def isbn
    @isbn
  end
  
  def price
    @price
  end
  
  def isbn= isbn
    isbn.empty? ? raise(ArgumentError, 'ISBN cannot be empty') : @isbn = isbn
  end
  
  def price= price
    price.to_f <= 0 ? raise(ArgumentError, 'Price cannt be zero or negative') : @price = price.to_f
  end
  
end
