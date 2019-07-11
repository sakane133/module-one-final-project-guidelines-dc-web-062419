require_relative '../config/environment'

# prints menu, takes in choice, executes relevant subroutine

def menu

  # prints menu and options
  puts Rainbow("\nWhat would you like to do? Your options are:\n").cyan
  puts Rainbow("    s: search your notes, lessons, repos, and topics
    n: create a note about one of your lessons
    l: open the Learn.co page for a lesson
    r: open your forked repo for a lab
    o: open the original learn.co repo for a lab
    q: leave Note Overflow\n").magenta

  # takes in user's choice
  choice = sanitize(gets.chomp)

  # executes user's choice
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
