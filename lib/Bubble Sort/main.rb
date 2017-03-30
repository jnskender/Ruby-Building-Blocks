#  #take list of elements
#  #compare first pair of elements
#  #if element on the left > right
#  #swap elements
#  #set swap value to true if elements have been swapped else fale
#  #continue to swap for all next pairs
#  # continue untill iterate list.size - 1 to ensure sorted
#  # end early if swap = false
#  #print new list

def bubble_sort(list)
    n = list.length
    loop do
        swapped = false
        (n - 1).times do |i|
            if list[i] > list[i + 1]
                list[i], list[i + 1] = list[i + 1], list[i]
                swapped = true
            end
        end
        break unless swapped
    end
    puts list.join(', ')
end # end bubble_sort

def bubble_sort_by(list)
    n = list.length
    loop do
        swapped = false
        (n - 1).times do |i|
            if yield(list[i], list[i + 1]) > 0
                list[i], list[i + 1] = list[i + 1], list[i]
                swapped = true
            end
        end
        break unless !swapped
    end
    puts list.join(', ')
end

bubble_sort([4, 3, 78, 2, 0, 2])
bubble_sort(%w(hi hello hey zimbabwe)) { |left, right| left.length - right.length }
