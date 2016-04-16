# Lambdas as a mechanism for Open/Closed - CodeWars 8(RUBY)
spoken    =->(greeting) { "#{greeting.capitalize}." }
shouted   =->(greeting) { "#{greeting.upcase}!"}
whispered =->(greeting) { "#{greeting.downcase}." }
greet =->(style, msg) { style.call(msg) }

# test_cases
greet.(spoken, "Hello")
greet.(shouted, "Hello")
greet.(whispered, "Hello")

#Evil Autocorrect Prank - CodeWars 7(RUBY)
# Every form of "you" "youuu" or "u" gets changed to "your sister"
def autocorrect(string)
	word_array = string.split
	word_array.map! {|w| w.gsub(/^you+\b|^u\b/i, "your sister")}.join(" ")
end 

# OK so the spit into an array wasn't necessary since \b was able to tell us the border of a word.. 
# def autocorrect(input)
#   input.gsub(/\b(you+|u)\b/i, 'your sister')
# end

autocorrect("I miss you!")
autocorrect("I miss u!!!")
autocorrect("I love YOU")
autocorrect("I love youuu?")
autocorrect("I love bayou")
autocorrect("I love u")
autocorrect("I love your hair; ur great")


#Largest 5 digit number in a series - CodeWars 6 (RUBY)
# passed in as a string of only digits; return a five digit integer; passed may be as large as 1000 digits.
def solution(digits)
	largest = (digits[0]+digits[1]+digits[2]+digits[3]+digits[4]).to_i
	i = 4
	while i < digits.length
		tester = (digits[i-4]+digits[i-3]+digits[i-2]+digits[i-1]+digits[i]).to_i
		if tester > largest
			largest = tester
		end 
		i += 1
	end 
	largest
end

# someother person's beautiful answer.. One day.. 
# def solution(digits)
#   digits.split('').each_cons(5).max.join.to_i
# end

# test_cases
solution("283910")

# IQ Test - Finding num's layman's position that differs in even-ness - Code Wars #5 (RUBY)
def iq_test(numbers)
  numbers = numbers.split(" ")
  even_array = []
  odd_array = []
  numbers.each do |num|
  	if num.to_i.even?
  		even_array.push(num)
  	else
  		odd_array.push(num)
  	end
  end 
  if even_array.size > odd_array.size
  	numbers.index(odd_array[0]) + 1
  else
  	numbers.index(even_array[0]) + 1
  end 
end

# test_cases
iq_test("2 4 7 8 10")
iq_test("1 2 2")


# Finding the next Perfect Square - Code Wars #4 (RUBY)
# Assume Parameter POSITIVE
def find_next_square(sq)
  # Return the next square if sq is a perfect square, -1 otherwise
  	num = Math.sqrt(sq)
	if num == num.floor
		(sq+num*2+1).to_i
	else
		-1 
	end 
end

# test_cases
find_next_square(121)

# Counting in the Amazon - Code Wars #3 (RUBY)
# Take a given number and return the Arara's equivalent. WITH NO TRAILING SPACES!!
# 1 = anane 
# 2 = adak 
# 3 = adak anane 
# 4 = adak adak 
# 5 = adak adak anane 
# 6 = adak adak adak
# 7 = adak adak adak anane
# 8 = adak adak adak adak 

def count_arara(num)
	num_adak = (num/2).floor
	num_anane = num%2
	phrase = "adak "*num_adak + "anane"*num_anane
	phrase = phrase.sub(/[" "]\Z/, "")
	phrase
end

# Oh you beutiful people!! 
# (['adak'] * (n / 2) + ['anane'] * (n % 2)).join(' ')

# test_cases
count_arara(3) 
count_arara(8)

# Remove all in Union items - Code Wars #2 (RUBY)
def array_diff(a, b)
	a.each do |element| 
		if b.include?(element)
			a.delete(element)
			b.delete(element)
		end
	end
    a
end

# I coulld have saved so much code!! 
# def array_diff(a, b)
# 	a-b
# end

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