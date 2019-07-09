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
      "#{lesson.topic.name} :: #{lesson.title} :: #{lesson.repo} ::
      #{lesson.note_collection}

      "
    }
    puts pretty_print
    menu
  else
    "No results found."
    menu
  end
end
