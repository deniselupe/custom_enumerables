module Enumerable
  # My version of .each_with_index()
  def my_each_with_index
    for i in 0..self.length - 1
      yield(self[i], i)
    end

    self
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
      result << my_block.call(elem)
    end

    result.include?(false) ? false : true
  end

  # My version of .any?()
  def my_any?(&my_block)
    result = []

    self.my_each do |elem|
      result << my_block.call(elem)
    end

    return false if result.empty?
    result.include?(true) ? true : false
  end

  # My version of .none?()
  def my_none?(&my_block)
    result = []

    self.my_each do |elem|
      result << my_block.call(elem)
    end

    result.include?(true) ? false : true
  end

  # My version of .count()
  def my_count(&my_block)
    return self.length unless block_given?

    result = []

    self.my_each do |elem|
      result << elem if my_block.call(elem) === true
    end

    result.length
  end

  # My version of .map()
  def my_map(&my_block)
    result = []

    self.my_each do |elem|
      result << my_block.call(elem)
    end

    result
  end

  # My version of my_inject()
  def my_inject(init_val = nil, sym = nil)
    sym = init_val if init_val.is_a?(Symbol)
    result = !init_val.is_a?(Symbol) && !init_val.nil? ? init_val : 0
    return 'ERROR: No block given' if sym.nil? && !block_given?

    if block_given?
      self.my_each { |elem| result = yield(result, elem) }
    else
      sym = sym.to_proc
      self.my_each { |elem| result = sym.call(result, elem) }
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
