class Array

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!
#
# Example:
#
# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements.
# Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index.
# If the size of any argument is less than self, nil is returned for that location.

def my_flatten
  dup = self.dup
  result = []
  dup.each do |el|
    if el.is_a?(Array)
      result.concat(el.my_flatten)
    else
      result << el
    end
  end
  result
end

def my_zip(*args)
  ret = []
  self.each_with_index do |el, idx|
    temp_array = [el]
    args.each do |array|
      temp_array << array[idx]
    end
    ret << temp_array
  end
  ret
end
# Example:
#
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# My Rotate
# Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.
#
# Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]
def my_rotate(shift = 1)
  shift = shift % count
  drop(shift) + take(shift)
end
# My Join
# my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.
#
# Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"

def my_join(separator = "")
  ret = ""
  each_with_index do |el, i|
    if i == count - 1
      ret << el
    else
      ret << el + separator
    end
  end
  ret
end


def my_reverse
  dup = self.dup
  ret = []
  until dup.empty?
    ret << dup.pop
  end
  ret
end

def rev_rec
  return self if count == 1
  self.drop(1).rev_rec + [self.first] 
end

# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.
#
# Example:
#
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
end
