# takes in a lesson name and opens the student's repo
# in their browser of choice

def repo_learn
  get_lesson
  url = "https://github.com/learn-co-students/#{$found_lesson.repo}"
  system("open",url)
  menu
end
