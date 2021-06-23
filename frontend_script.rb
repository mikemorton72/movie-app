# NOT PART OF RAILS, JUST A RUBY SCRIPT
require 'http'
require 'tty-prompt'

def get_index(table)
  items = HTTP.get("http://localhost:3000/#{table}").parse(:json)
  items.each do |item|
    pp item
    puts
  end
end

def get_show(table, id)
  item = HTTP.get("http://localhost:3000/#{table}/#{id}").parse(:json)
  pp item
end

prompt = TTY::Prompt.new
while true
  system("clear")
  category = prompt.select("Choose which category you would like to browse.", %w(Movies Actors))
  action = prompt.select("Would you like to view all #{category.downcase} or a specific ID?", ["All",  "Specific ID"])
  if action == "All"
    get_index(category.downcase)
  elsif action == "Specific ID"
    puts "Please Enter your #{category} ID."
    id = gets.chomp
    get_show(category.downcase, id)
  end
  continue_quit = prompt.select("Select and option below.", %w(Continue Quit))
  if continue_quit == "Quit"
    break
  end
end