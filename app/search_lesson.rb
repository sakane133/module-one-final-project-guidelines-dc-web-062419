require_relative '../config/environment'

# takes in a search string formatted for SQL "like" search
# returns set of lessons where the search string appears in the title

def search_lesson(like_search_string)
  Lesson.where("title LIKE ?", like_search_string)
end
