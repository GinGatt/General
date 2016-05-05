# NumberTheory -Explosive Sum - CodeWars 12(RUBY)
#partition theory - shows number of different ways you can add to get n
#eg 4 = 4; 3+1; 2+2; 2+1+1; 1+1+1+1

def exp_sum(n, hash = {0=>1, 1=>1})
	if n > 1
		calc_array = []
		pent_arr = calc_pent(n)
		len = pent_arr.length
		count = 0
		while count < len
			pent_at_bat = pent_arr.pop
			num_to_part = n - pent_at_bat
			if hash.has_key? (num_to_part)
				calc_array.unshift(hash[num_to_part])
			elsif  num_to_part > -1
				new_val = exp_sum(num_to_part, hash)
				hash[num_to_part] = new_val
				calc_array.unshift(new_val)
			end 
			count += 1
		end
		sum_array(calc_array)
	elsif n < 0
		return 0
	else 
		return 1
	end
end 
def calc_pent(n)
	num = 1
	pent_arr = []
	begin 
		num%2 == 0 ? (p = -num/2) : (p = (num+1)/2)
		pent = (3*p**2 - p)/2
		pent_arr.push(pent)
		num += 1
	end while pent < n
	pent_arr
end 
def sum_array(calc_array)
	sum = 0
	calc_array.each_with_index do |num, index|
		if (index+1)%4 == 1 || (index+1)%4 == 2
			sum += num
		else
			sum -= num
		end 
	end 
	sum
end		
# test_cases
exp_sum(-1)
exp_sum(0)
exp_sum(1)
exp_sum(2)
exp_sum(6)
exp_sum(10)
exp_sum(50)


#Title Case - CodeWars 11(RUBY)
def title_case(title, minor_words='')
	title_array = title.downcase.split(' ')
	minor_words_array = minor_words.downcase.split(' ')
	title_array.map!{|e|
		if minor_words_array.include?(e) == false || title_array[0] == e
			e.capitalize
		else 
			e
		end 
	} 
	title_array.join(' ')
end

# Read it and weep.. 
# def title_case(title, minor_words = '')
#   title.capitalize.split().map{|a| minor_words.downcase.split().include?(a) ? a : a.capitalize}.join(' ')
# end

# test_cases
title_case('')
title_case('a clash of KINGS', 'a an the of')
title_case('THE WIND IN THE WILLOWS', 'The In')
title_case('the quick brown fox')

# Valid Parentheses - CodeWars 10(RUBY)
# determines if order of parantheses is valid.. 
def validParentheses(string)
	# are there any characters that aren't parantheses?
	# count num of open paren, adjusting for closures, if dips negative, unmatched
	string = string.gsub(/[^\)|^\(]/, "")
	count = 0
	string.each_char do |char|
		char == "(" ? (count +=1) : (count -=1)
		return false if count < 0
	end 
	# at end iteration, must have equal num of open and closed
	count == 0 ? (true) : (false)
end 

# test_cases
validParentheses("())(()")
validParentheses( " (hi)bye" )
validParentheses(")(")
validParentheses( ")(()))" )
validParentheses( "(" )
validParentheses( "(())((()())())" )

# Did I finish my Sudoku? - CodeWars 9(RUBY)
def done_or_not(board)
	if chk_horizontal(board) == true && chk_vertical(board) == true && chk_region(board) == true
		'Finished!'
	else 
		'Try again!'
	end 
end 

def chk_horizontal(board)
	k = 8
	while k > 0
		j = 8
		while j > 0
			if board[k].include? (j+1)
				j -= 1
			else
				return false
			end 
		end 
		k -=1
	end
	true
end 

def chk_vertical(board)
	# get arrays of vertical 
	vertical_arrays = []
	count = 0
	while count < 9
		vertical_array = []
		board.each do |array|
			vertical_array.push(array[count])
		end
		vertical_arrays.push(vertical_array)
		count += 1
	end
	
	# check arrays for appropriate #
	chk_horizontal(vertical_arrays)
end 

def chk_region(board)
	# get array of regions
	region_arrays = []
	col = 0
	count = 0
	while col < 7 && count < 3
		row = count * 3
		region_array = []
		# I only want the condition evaluated after the code runs..  
		begin
			region_array.concat(board[row][col..col+2])
			row +=1
		end while row%3 > 0
		region_arrays.push(region_array)
		col +=3
		# if finishes first row of three go to next rows of 3, 2 more times
		if col == 9
			count +=1
			col = 0
		end 
	end 
	chk_horizontal(region_arrays)
end 

# test_cases
done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 5, 3, 4, 8],
                         [1, 9, 8, 3, 4, 2, 5, 6, 7],
                         [8, 5, 9, 7, 6, 1, 4, 2, 3],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 6, 1, 5, 3, 7, 2, 8, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 4, 5, 2, 8, 6, 1, 7, 9]])
done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 0, 3, 4, 9],
                         [1, 0, 0, 3, 4, 2, 5, 6, 0],
                         [8, 5, 9, 7, 6, 1, 0, 2, 0],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 0, 1, 5, 3, 7, 2, 1, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 0, 0, 4, 8, 1, 1, 7, 9]])

# life could have been easier with .transpose or requiring matrix
# def done_or_not(board)
#   temp = board.transpose
#   x_mod, y_mod = 0
#   (0..8).each do |reg|
#     array = []
#     x_mod = (reg * 3 ) % 9
#     y_mod = ( reg / 3) * 3
#     (0..2).each { |x| (0..2).each { |y| array.push board[x + x_mod][y + y_mod] }}
#     if board[reg] != board[reg].uniq || temp[reg] != temp[reg].uniq || array != array.uniq
#       return 'Try again!'
#     end
#   end
#   return 'Finished!'
# end

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

# OK so the split into an array wasn't necessary since \b was able to tell us the border of a word.. 
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

# some other person's beautiful answer.. One day.. 
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