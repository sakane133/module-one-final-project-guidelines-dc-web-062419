require_relative '../config/environment'

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
