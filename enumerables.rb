require 'byebug'
class Array

  def my_each(&prc)
    i = 0
    while i < count
      prc.call(self[i])
      i+=1
    end
    self
  end

  def my_map(&prc)
    ret = []
    my_each {|el| ret << prc.call(el)}
    ret
  end

  def my_select(&prc)
    ret = []
    my_each do |el|
      ret << el if prc.call(el)
    end
    ret
  end

  def my_inject(acc = nil, &prc)
    dup = self.dup
    acc ||= self.shift
    dup.my_each do |el|
      acc = prc.call(acc, el)
    end
    acc
  end

  def my_reject(&prc)
    ret = []
    my_each do |el|
      ret << el unless prc.call(el)
    end
    ret
  end

  def my_any?(&prc)
    # debugge
    my_each {|el| return true if prc.call(el)}
    false
  end

  def my_none?(&prc)
    my_each {|el| return false if prc.call(el)}
    true
  end

  def my_all?(&prc)
    my_each {|el| return false unless prc.call(el)}
    true
  end


end
