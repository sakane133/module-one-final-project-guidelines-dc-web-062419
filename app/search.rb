require_relative '../config/environment'

# looks for string within topics, lessons, repos, or notes
# returns a 4-column table with topic, lesson, repo, notes

def search
  puts "Enter word or phrase: "
  search_string = gets.chomp
  if search_string.downcase == "menu"
    menu
  elsif
    lesson_subset = Lesson.all.select {|lesson| lesson.class == Lesson}
      # TODO
      # search_string in topic
      # search_string in lesson name
      # search_string in repo name
      # search_string in notes
    pretty_print = lesson_subset.map {|lesson|
      "#{lesson.topic.name} :: #{lesson.title} :: #{lesson.repo} :: #{lesson.note_collection}
      
      "
    }
    puts pretty_print
    puts "Would you like go to the Learn.co page, open your repo, or take a note?"
    puts "Choose learn, repo, note, or menu."
    choice = gets.chomp
    if choice.downcase == "menu"
      menu
    elsif choice.downcase == "learn"
      learn
    elsif choice.downcase == "repo"
      repo
    elsif choice.downcase == "note"
      take_note_known_lesson
    else
      "That's not a valid response."
      menu
    end
  else
    "No results found."
    menu
  end
end
