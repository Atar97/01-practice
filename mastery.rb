require 'byebug'
class Array

  def bubblesort!(&prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}
    sorted = false
    until sorted
      sorted = true
      i = 0
      until i == count - 1
        if prc.call(self[i], self[i+1]) == 1
          sorted = false
          self[i], self[i+1] = self[i+1], self[i]
        end
        i+=1
      end
    end
    self
  end

  def bubblesort
    self.dup.bubblesort!
  end

  def merge_sort(&prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}
    return self if count == 1
    left = self.take(count/2)
    right = self.drop(count/2)
    Array.merge_helper(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end


  def self.merge_helper(left, right, &prc)
    ret = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        ret << left.shift
      else
        ret << right.shift
      end
    end
    ret + left + right
  end

  def subsets
    # byebug
    return [[]] if self.empty?
    subs = self.drop(1).subsets
    subs.concat(subs.map {|sub| sub.dup << self[0]})
  end

  def permutations
    duped = self.dup
    return [duped] if count <= 1
    first = duped.pop
    perms = duped.permutations
    all = []
    perms.each do |perm|
      for i in (0..perm.count)
        all << perm.take(i) + [first] + perm.drop(i)
      end
    end
    all
  end

  def make_change(target, coins = [1,5,10,25])
    
  end

end
