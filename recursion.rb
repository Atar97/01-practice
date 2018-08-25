require 'byebug'
def range(num)
  return [] if num <= 1
  range(num - 1) + [num - 1]
end

def exp_one(base, pow)
  return 1 if pow == 0
  base * exp_one(base, pow - 1)
end

def exp_two(base, pow)
  return 1 if pow == 0
  return base if pow == 1
  half = pow / 2
  if pow.even?
    exp_two(base, half) * exp_two(base, half)
  else
    base * exp_two(base, half) * exp_two(base, half)
  end
end

class Array

  def deep_dup
    map {|el| el.is_a?(Array) ? el.deep_dup : el.dup}
  end

  def deep_dup_each
    ret = []
    self.each do |el|
      if el.is_a?(Array)
        ret << (el.deep_dup)
      else
        ret << el.dup
      end
    end
    ret
  end

  def b_search(target, &prc)
    # debugger
    prc ||= Proc.new {|el1, el2| el1 == el2}
    mid = count/2
    return mid if prc.call(self[mid], target)
    return nil if count == 1
    lower = take(mid)
    upper = drop(mid)
    if self[mid] < target
      found = upper.b_search(target, &prc)
      mid + found unless found.nil?
    else
      lower.b_search(target, &prc)
    end
  end

  def merge_sort(&prc)
    # byebug
    return self if count <= 1
    prc ||= Proc.new {|el1, el2| el1 <=> el2}
    mid = count/2
    left = take(mid)
    right = drop(mid)
    Array.merge_helper(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end


  def self.merge_helper(left, right, &prc)
    ret = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == 1
        ret << right.shift
      else
        ret << left.shift
      end
    end
    ret + left + right
  end

  def subsets
    # debugger
    return [[]] if empty?
    subs = drop(1).subsets
    subs.concat(subs.map {|el| el += take(1)})
  end

  def permutations
    return self if count == 1
    mid = count/2
    first = take(mid)
    second = drop(mid)
    [first.permutations, second.permutations]
  end

end


def fib_array(num)
  return [0] if num <= 1
  return [0,1] if num == 2
  n_less = fib_array(num - 1)
  n_less << n_less[-1] + n_less[-2]
end
