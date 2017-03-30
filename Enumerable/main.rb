
module Enumerable
    def my_each
        for i in 0...length do
            yield self.to_a[i]
        end
        self
    end

    def my_each_with_index
      for i in 0...length do
          yield self[i] , index(i)
      end
       self
    end

    def my_select
      result =[]
      self.my_each {|x| result << x if yield x}
      result
    end

    def my_all?
      self.my_each {|x| return false unless yield x}
      true
    end

    def my_any?
      self.my_each {|x| return true if yield x}
      false
    end

    def my_none?
      self.my_each{|x| return false unless !yield x}
      true
    end

    def my_count
      count = 0
      if block_given?
        my_each {|x| count += 1 if yield x}
      else
        length.times {count +=1}
      end
      count
    end
end

  def my_map(mapper = nil)
    result = []
    my_each do |x|
      if !mapper.nil?
        result << x if mapper.call(x)
      else
        result << x if yield x
      end
    end
    result
  end

  def my_inject(carry_value = nil)
    carry_value = shift if carry_value.nil?
    my_each { |x| carry_value = yield(carry_value, x) }
    carry_value
  end
