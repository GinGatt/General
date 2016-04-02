class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)]

#Iteration 1
def printer(home_array)
  home_array.each do |hm|
  puts "#{hm.name} in #{hm.city} costs $#{hm.price} and houses #{hm.capacity} people."
  end

  puts "\n"
end

printer(homes)

#Iteration 2
#Ask user if they want values least to greatest or greatest to least
def getOrder
  puts "Do you want Ascending or Descending? (ASC, DESC)"
  order = gets.chomp.downcase

  while order != "asc" && order != "desc"
    puts "Do you want Ascending or Descending? (ASC, DESC)"
    order = gets.chomp.downcase
  end
  return order
end

#Find out what to sort by
def getSortMethod
  puts "How do you want to sort? (name, city, capacity, price)?"
  method = gets.chomp.downcase

  while method != "name" && method != "city" && method != "capacity" && method != "price"
    puts "How do you want to sort? (name, capacity, city, price)?"
    method = gets.chomp.downcase
  end
  return method
end

order = getOrder()
method = getSortMethod()
method_key = method.to_sym

if order == "asc"
  sorted = homes.sort do |hm1, hm2|
  hm1.send(method_key) <=> hm2.send(method_key)
  end
elsif order == "desc"
  sorted = homes.sort do |hm1, hm2|
  hm2.send(method_key) <=> hm1.send(method_key)
  end
end 

printer(sorted)

#Iteration3 - Filter by city
def getCity()
  puts "What city would you like to see? (San Juan, Seville, Pittsburgh, Málaga)"
  city = gets.chomp.downcase
  while city != "san juan" && city != "seville" && city != "pittsburgh" && city != "Málaga"
    puts "What city would you like to see? (San Juan, Seville, Pittsburgh, Málaga)"
    city = gets.chomp.downcase
  end
  return city
end

user_city = getCity()

in_city_homes = homes.select do |hm| 
  hm.city.downcase == user_city
end

# double check that select is working with puts in_city_homes.inspect
#print home information
printer(in_city_homes)

#Iteration4 - Average Price
def averagePrice(home_array)
  sum_price = home_array.reduce(0.0){|sum, hm| sum + hm.price}
  # puts sum_price
  average = sum_price / home_array.length
end

average_price = averagePrice(homes)
puts "The average price of the homes you are considering is $#{average_price}."

#Iteration5 - Name Your Price
def nameYourPrice(home_array)
  puts "What price would you like to pay?"
  user_price = gets.chomp
  home_array.find do |hm|
    hm.price.to_s == user_price
  end
end

price_match = nameYourPrice(homes)
puts "#{price_match.name} in #{price_match.city} costs $#{price_match.price} and houses #{price_match.capacity} people."








