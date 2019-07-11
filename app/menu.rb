require_relative '../config/environment'

def menu
  puts Rainbow("\nWhat would you like to do? Your options are:\n").cyan
  puts Rainbow("    s: search your notes, lessons, repos, and topics
    n: create a note about one of your lessons
    l: open the Learn.co page for a lesson
    r: open your forked repo for a lab
    o: open the original learn.co repo for a lab
    q: leave Note Overflow\n").magenta
  choice = sanitize(gets.chomp)
  if choice.downcase == "s"
    search
  elsif choice.downcase == "n"
    take_note
  elsif choice.downcase == "l"
    learn
  elsif choice.downcase == "r"
    repo
  elsif choice.downcase == "o"
    repo_learn
  elsif choice.downcase == "q"
    quit
  else
    puts Rainbow("\nThat's not a valid response.\n").red
    menu
  end
end
