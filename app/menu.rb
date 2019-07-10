require_relative '../config/environment'

def menu
  puts Rainbow("\nWhat would you like to do? Your options are:\n").cyan
  # puts "topics          - search and display topics in Learn.co."
  puts Rainbow("    search        - search your notes, lessons, repos, and topics
    note          - create a note about one of your lessons
    learn         - open the Learn.co page for a lesson
    repo          - open your forked repo for a lab
    quit          - leave Note Overflow").magenta
  puts ""
  choice = sanitize(gets.chomp)
  if choice.downcase == "search"
    search
  elsif choice.downcase == "note"
    take_note
  elsif choice.downcase == "learn"
    learn
  elsif choice.downcase == "repo"
    repo
  elsif choice.downcase == "quit"
    quit
  else
    puts Rainbow("\nThat's not a valid response.\n").red
    menu
  end
end
