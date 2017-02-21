require "pp"
=begin
#take a sentence
#compare each word to a predefined dictionary
#for each word compare to dictionary and look for substring
#if word contains a substring create a hash key for that substring
and increment its value
#print the hash
=end
def substrings(words,dictionary)
  words = words.split(/\W+/)
  substrings = Hash.new(0)

  words.each_with_index do |word,i|
    j = i
    for j in 0...dictionary.size
      if word.downcase.include? dictionary[j]
        substrings[dictionary[j]] +=1
      end
    end
  end #end each
 pp substrings.sort_by {|k,v| v}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?",dictionary)
#Expect {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
