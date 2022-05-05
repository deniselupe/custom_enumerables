module Enumerable
  # My version of .each_with_index()
  def my_each_with_index
    for i in 0..self.length - 1
      yield(self[i], i)
    end

    return self
  end

  # My version of .select()
  def my_select(&my_block)
    result = []

    self.my_each do |elem|
      result << elem if my_block.call(elem) === true
    end

    result
  end

  # My version of .all?()
  def my_all?(&my_block)
    result = []

    self.my_each do |elem|
      my_block.call(elem) ===  true ? result << true : result << false
    end

    return result.include?(false) ? false : true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield(i)
    end
  end
end
