# takes in a lesson name and opens the student's repo
# in their browser of choice

def repo
  get_lesson
  url = "https://github.com/#{$this_student.github_username}/#{$found_lesson.repo}"
  system("open",url)
  menu
end
