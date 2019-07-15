module Search
  # takes in a search string formatted for SQL "like" search
  # returns set of lessons where the search string appears in the title
  def search_lesson(like_search_string)
    Lesson.where("title LIKE ?", like_search_string)
  end
  # takes in a search string formatted for SQL "like" search
  # returns set of lessons where the search string appears in the notes text
  def search_notes(like_search_string)
    note_set = Note.where("note_text LIKE ?", like_search_string)
    filtered_note_set = note_set.select {|n| n.student_id == this_student.id}
    lesson_id_set = filtered_note_set.map {|n| n.lesson_id}
    note_search = lesson_id_set.map {|lid| Lesson.find(lid)}
  end
  # takes in a search string formatted for SQL "like" search
  # returns set of lessons where the search string appears in the repo
  def search_repo(like_search_string)
    Lesson.where("repo LIKE ?", like_search_string)
  end
  # takes in a search string formatted for SQL "like" search
  # returns set of lessons where the search string appears in the topic
  def search_topic(like_search_string)
    topic_set = Topic.where("name LIKE ?", like_search_string)
    topic_ids = topic_set.map {|t| t.id}
    topic_search = Lesson.all.select {|l|
      topic_ids.any?{|tid|
        tid == l.topic_id
      }
    }
  end
  # looks for string within topics, lessons, repos, or notes
  # returns a 4-column table with topic, lesson, repo, notes
  def search
    # get search string
    puts Rainbow("\nEnter word or phrase. (Type \"m\" for menu or \"q\" to quit.) \n").cyan
    search_string = sanitize(gets.chomp)
    like_search_string = "%#{search_string.downcase}%"
    # merge arrays of lessons returned by searches
    lesson_subset =
      search_topic(like_search_string) |
      search_lesson(like_search_string) |
      search_repo(like_search_string) |
      search_notes(like_search_string)
    # return results, give another chance, or exit search
    if search_string.downcase == "m"
      menu
    elsif search_string.downcase == "q"
      quit
    elsif lesson_subset.size == 0
      puts Rainbow("\nNo results found. Please try again.").red
      search
    else
      puts pretty_print(lesson_subset)
      menu
    end
  end
end
