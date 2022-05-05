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

  # My version of .any?()
  def my_any?(&my_block)
    result = []

    self.my_each do |elem|
      my_block.call(elem) === true ? result << true : result << false
    end

    return false if result.empty?
    return result.include?(true) ? true : false
  end

  # My version of .none?()
  def my_none?(&my_block)
    result = []

    self.my_each do |elem|
      my_block.call(elem) === true ? result << true : result << false
    end

    return result.include?(true) ? false : true
  end

  # My version of .count()
  def my_count(&my_block)
    if block_given?
      result = []

      self.my_each do |elem|
        result << elem if my_block.call(elem) === true
      end

      return result.length
    else
      return self.length
    end
  end

  # My version of .map()
  def my_map(&my_block)
    result = []

    self.my_each do |elem|
      result << my_block.call(elem)
    end

    result
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
