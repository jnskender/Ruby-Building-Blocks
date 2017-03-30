def caesar_cipher(phrase, shift_num = 1)
    alphabet = ('a'..'z').to_a
    phrase = phrase.split('')
    cypher = []

    phrase.each do |char|
        index = alphabet.index(char.downcase) #position in alphabet 0-25
        if char == ' '
            cypher.push(' ')
            next
        elsif index + shift_num > 25 #if shift must wrap back around to beginning of alphabet
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
   cypher.join('')
end

def isUpper?(char)
    char == char.upcase
end
