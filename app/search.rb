require_relative '../config/environment'

# looks for string within topics, lessons, repos, or notes
# returns a 4-column table with topic, lesson, repo, notes

def search
  puts Rainbow("\nEnter word or phrase: \n").cyan
  search_string = sanitize(gets.chomp)
  like_search_string = "%#{search_string.downcase}%"
  # search_string in topic
  topic_set = Topic.where("name LIKE ?", like_search_string)
  topic_ids = topic_set.map {|t| t.id}
  topic_search = Lesson.all.select {|l|
    topic_ids.any?{|tid|
      tid == l.topic_id
    }
  }
  # search_string in lesson name
  lesson_search = Lesson.where("title LIKE ?", like_search_string)
  # search_string in repo name
  repo_search = Lesson.where("repo LIKE ?", like_search_string)
  # search_string in url
  url_search = Lesson.where("url LIKE ?", like_search_string)
  #search_string in notes
  note_set = Note.where("note_text LIKE ?", like_search_string)
  filtered_note_set = note_set.select {|n| n.student_id == $this_student.id}
  lesson_id_set = filtered_note_set.map {|n| n.lesson_id}
  note_search = lesson_id_set.map {|lid| Lesson.find(lid)}
  # merge search arrays of lessons
  lesson_subset = topic_search | lesson_search | repo_search | url_search | note_search
  # print out rows with all lesson info
  pretty_print = lesson_subset.map {|lesson|
    Rainbow("\n#{lesson.topic.name}").yellow +
    Rainbow(" :: #{lesson.title} :: ").white +
    Rainbow("#{lesson.repo}").green +
    Rainbow("\n    #{lesson.note_collection}").white
  }
  if search_string.downcase == "menu"
    menu
  elsif lesson_subset.size == 0
    puts Rainbow("\nNo results found. Please try again.").red
    search
  else
    puts pretty_print
    menu
  end
end
