# Remove all in Union items - Code Wars #2 (RUBY)
def array_diff(a, b)
	# a.each do |element| 
	# 	if b.include?(element)
	# 		a.delete(element)
	# 		b.delete(element)
	# 	end
	# end
 #    a
 p a-b
end

# test_cases
array_diff([1,2], [1])
array_diff([1,2,2], [1])
array_diff([1,2,2], [2])
array_diff([1,2,2], [])
array_diff([], [1,2])

# Invalid Input Handling - Code Wars #1 (RUBY)
def get_count(*words)

	if words[0].class == String
		# remove anything not a-zA-z
		words = words[0].gsub(/[^a-z^A-Z]/, "")
		# take everything to downcase to better count vowels, get total length string
		words = words.downcase
		len = words.length

		# match aeio; will return[]; count #vowels
		vowels = words.scan(/[aeiou]/)
		vowel_len = vowels.length
		consonants_len = len - vowel_len

		# create new Hash with info 
		output = {"vowels"=>vowel_len, "consonants" =>consonants_len}
	else
		output = {"vowels"=>0, "consonants" =>0}
	end 
end

# test_cases
get_count('aeiou')
get_count('Test')
get_count(' ')
get_count('45ttt')
get_count('Here is some text')
get_count()
get_count(nil)