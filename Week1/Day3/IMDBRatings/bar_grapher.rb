class BarGrapher
	def initialize(movies)
		@movies = movies
		@grid = ""
	end 

	def make_graph
		make_grid
		make_key
		puts @grid
	end 

	def get_ratings
		@ratings =[]
		@movies.each do |movie|
			rating = movie.rating
			@ratings.push(rating.round)
		end 
	end
	def make_grid
		get_ratings
		num_rows = @ratings.max 
		count = num_rows

		while count > 0
			@grid += "|"
			@ratings.each do |rating|
				if rating > count || rating == count
					@grid += "#|"
				else 
					@grid += " |"
				end 
			end
			count -= 1
			@grid += "\n"
		end 
	end

	def make_key
		len = @movies.size
		
		# make division
		@grid += ("-"*3) * len
		
		# make numbered key
		@grid += "\n|"
		count = 1
		while count < len + 1
			@grid += "#{count}|"
			count += 1
		end 

		# make lower list
		@grid += "\n"
		@movies.each_with_index do |movie, index|
			@grid += "\n#{index+1}. #{movie.title} #{movie.rating}"
		end 

	end 
end 