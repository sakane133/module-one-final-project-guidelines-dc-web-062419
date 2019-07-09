require_relative '../config/environment'

# This method takes in a lesson name and opens the Learn.co URL
# in someone's browser of choice

def learn(lesson_name)
  url = Lesson.find_by(lesson: lesson_name).url
  system("open",url)
  menu
end
