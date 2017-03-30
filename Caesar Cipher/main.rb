def caesar_cipher(phrase, shift_num = 1)
    alphabet = ('a'..'z').to_a
    phrase = phrase.split('')
    cypher = []

    phrase.each do |char|
        index = alphabet.index(char.downcase)
        if char == ' '
            cypher.push(' ')
            next
        elsif index + shift_num > 25
            position = (shift_num - 1) - (25 - index)
        else
            position = index + shift_num
        end

        if isUpper?(char)
            cypher.push(alphabet[position].upcase)
        else
            cypher.push(alphabet[position])
        end
    end
  puts cypher.join('')
end

def isUpper?(char)
    char == char.upcase
end

puts"-----------Caesar-Cipher---------------"
puts "Please enter a phrase to be Encrypted with the Caesar cipher"
phrase = gets.chomp

puts "Please enter how many shifts to be used"
shift = gets.chomp.to_i

puts "Encrypted Code:"
caesar_cipher(phrase,shift)
