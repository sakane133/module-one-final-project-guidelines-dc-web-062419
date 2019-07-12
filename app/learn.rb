# This method takes in a lesson name and opens the Learn.co URL
# in someone's browser of choice

def learn
  get_lesson
  url = $found_lesson.url
  system("open",url)
  menu
end
