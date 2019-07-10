require_relative '../config/environment'

# looks for string within topics, lessons, repos, or notes
# returns a 4-column table with topic, lesson, repo, notes

def search
  puts "Enter word or phrase: "
  search_string = gets.chomp
  if search_string.downcase == "menu"
    menu
  elsif     
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
    # search_string in notes
    note_search = Lesson.where("url LIKE ?", like_search_string)
    # merge search arrays of lessons
    lesson_subset = topic_search | lesson_search | repo_search | note_search
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
