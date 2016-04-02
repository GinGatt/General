class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]


def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

array_printer(array_of_languages)

 aged_languages = array_of_languages.map do |lng|
 	lng.age = lng.age + 1
 	lng
 end
 # puts aged_languages.inspect

puts "\n"
puts "The programming languages aged one year are: "
array_printer(aged_languages)


desc_ordered_languages = array_of_languages.sort_by{|lng| lng.age}.reverse
# puts desc_ordered_languages.inspect

puts "\n"
puts "The programming languages sorted by age are:"
array_printer(desc_ordered_languages)

truncated_languages = array_of_languages.delete_if{|lng| lng.name == "Java"}
# puts truncated_languages.inspect

puts "\n"
puts "The programming languages without Java:"
array_printer(truncated_languages)

shuffled_languages = array_of_languages.shuffle

puts "\n"
puts "The programming languages shuffled are:"
array_printer(shuffled_languages)












