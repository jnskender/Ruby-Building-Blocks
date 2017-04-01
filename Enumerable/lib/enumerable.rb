
module Enumerable
    def my_each
        if block_given?
            for i in 0...length do
                yield to_a[i]
            end
        else
            return to_enum
        end
        self
    end

    def my_each_with_index
        return to_enum unless block_given?
        for i in 0...length do
            yield self[i], index(i)
        end
        self
    end

    def my_select
        return to_enum unless block_given?
        result = []
        my_each { |x| result << x if yield x }
        result
    end

    def my_all?
        my_each { |x| return false unless yield x }
        true
    end

    def my_any?
        my_each { |x| return true if yield x }
        false
    end

    def my_none?
        my_each { |x| return false if yield x }
        true
    end

    def my_count
        count = 0
        if block_given?
            my_each { |x| count += 1 if yield x }
        else
            length.times { count += 1 }
        end
        count
    end

    def my_map(mapper = nil)
        result = []
        return to_enum unless block_given?
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
end
