require_relative '../config/environment'

def menu
  puts "What would you like to do? Your options are:"
  puts ""
  # puts "topics          - search and display topics in Learn.co."
  puts "search        - search your notes, lessons, repos, and topics"
  puts "note          - create a note about one of your lessons"
  puts "exit          - leave Note Overflow"
  puts ""
  choice = gets.chomp
  if choice.downcase == "search"
    search
  elsif choice.downcase == "note"
    note
  elsif choice.downcase == "exit"
    exit
  else
    puts "That's not a valid response."
    menu
  end
end
