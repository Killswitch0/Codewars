# https://www.codewars.com/kata/57a4c85de298a795210002da

#Detail

# Countdown is a British game show with number and word puzzles. 
# The letters round consists of the contestant picking 9 shuffled letters 
# - either picking from the vowel pile or the consonant pile. 
# The contestants are given 30 seconds to try to come up with the longest English word 
# they can think of with the available letters 
# - letters can not be used more than once unless there is another of the same character.

# #Task

# Given an uppercase 9 letter string, letters, find the longest word that can be made with some or all of the letters. The preloaded array words (or $words in Ruby) contains a bunch of uppercase words that you will have to loop through. Only return the longest word; if there is more than one, return the words of the same lengths in alphabetical order. If there are no words that can be made from the letters given, return None/nil/null.

# ##Examples

#   letters = "ZZZZZZZZZ"
#   longest word = None

#   letters = "POVMERKIA", 
#   longest word = ["VAMPIRE"]

#   letters = "DVAVPALEM"
#   longest word = ["VAMPED", "VALVED", "PALMED"]

require_relative 'words'

def longest_word(letters)
  matched_words = $WORDS.select do |word|
    word.chars.uniq.all? { |char| letters.to_s.count(char) >= word.count(char) }
  end
  
  return nil if matched_words.empty?
  
  sorted_words = matched_words.sort_by(&:length)
  sorted_words.reject { |word| word.length != sorted_words[-1].length }
end



p longest_word('GQEMAUVXY') # => ['GAME']
p longest_word('EAEEAYITB') # => ['BEAT', 'BITE', 'BYTE']
p longest_word('AKUIYOOLO') # => ['LOOK', 'YOLK']
p longest_word('GVDTCAESU') # => ['CAGES', 'CAUSE', 'CAVES', 'DATES', 'GATES', 'GUEST', 'STAGE', 'USAGE']
p longest_word("")          # => nil
p longest_word("MKMKMKMKM") # => nil
p longest_word("IIIWUGEZI") # => nil
