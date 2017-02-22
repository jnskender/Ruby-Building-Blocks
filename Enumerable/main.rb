
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
      values =[]
      self.my_each {|x| values << x if yield x}
      values
    end

    def my_all?
      self.my_each {|x| return false unless yield x}
      true
    end

end

=begin
array = [0,1,2,3]
puts '----------Each-----------'
array.each { |x| puts x }
puts "\n---------My_Each---------"
array.my_each { |x| puts x }

puts '----------Each_W/_Index-----------'
array.each_with_index { |v,i| puts "#{v} #{i}" }
puts '----------My_Each_W/_Index-----------'
array.my_each_with_index { |v,i| puts "#{v} #{i}" }

puts '----------Select-----------'
array.select { |x| puts x if x.even?  }   #=> [2, 4]
puts '----------My_Select-----------'
array.my_select { |x| puts x if x.even?  }   #=> [2, 4]
=end
array = ["1234","1234"]
puts '----------All?-----------'
puts array.all? { |x| x.length >= 4 }   #=> [true]
puts '----------My_All?-----------'
puts array.my_all? { |x| x.length >= 4 }   #=> [true]
