require_relative '../config/environment'

# This method takes in a lesson name and opens the student's repo
# in their browser of choice

def repo(lesson_name)
  url = "https://www.youtube.com/watch?v=5dsGWM5XGdg"
  system("open",url)
  menu
end
