require_relative '../config/environment'

def help_menu
  puts "What would you like to do? Your options are:"
  puts ""
  puts "note          - take a note"
  puts "repo          - find a repo by entering a lesson name"
  puts "lesson        - find a lesson by entering a repo name"
  puts "search        - search your notes, lessons, and topics"
  puts ""
  choice = gets.chomp
end
