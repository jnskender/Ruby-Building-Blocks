
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

    end
end

array = [0,1,2,3]
=begin
puts '----------Each-----------'
array.each { |x| puts x }
puts "\n---------My_Each---------"
array.my_each { |x| puts x }
=end


puts '----------Each_W/_Index-----------'
array.each_with_index { |v,i| puts "#{v} #{i}" }
puts '----------My_Each_W/_Index-----------'
array.my_each_with_index { |v,i| puts "#{v} #{i}" }
