require_relative '../config/environment'

def get_name_and_username
  puts "To begin, what's your name?"
  new_name = gets.chomp
  puts "And what's your github username?"
  new_username = gets.chomp
  puts ""
  puts "Thanks, #{new_name}. Let's get started."
end
