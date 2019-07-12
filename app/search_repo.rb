# takes in a search string formatted for SQL "like" search
# returns set of lessons where the search string appears in the repo

def search_repo(like_search_string)
  Lesson.where("repo LIKE ?", like_search_string)
end
