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
