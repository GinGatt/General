require "imdb"
require_relative "bar_grapher.rb"
# get title from .txt file
# use api call to match first result of title, get rating to nearest int

movie_titles = IO.readlines("movies.txt")
movies = movie_titles.map do |title|
	movies_object = Imdb::Search.new(title)
	
	# return first movie title's rating if rating, else search other matches until a rating found...
	rating = movies_object.movies[0].rating 
	if rating
		movies_object.movies[0]
	else
		len = movies_object.movies.length
		i = 1
		while rating == nil and i < len
			rating = movies_object.movies[i].rating
			i += 1
		end 
		movies_object.movies[i]
	end 
end 

b = BarGrapher.new(movies)
b.make_graph
