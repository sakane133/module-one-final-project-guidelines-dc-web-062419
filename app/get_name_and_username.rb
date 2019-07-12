# takes in user name
# creates in new user if they don't already exist
# prints thanks/start message

def get_name_and_username

  # take input from user
  puts Rainbow("To begin, what's your name?\n").cyan
  new_name = sanitize(gets.chomp)

  # create global variable for student this session
  $this_student = Student.find_or_create_by(name: new_name)

  # if this student doesn't exist yet in the db (has no repo),
  # create the student in the db and save their deets
  if $this_student.github_username.nil?
    puts Rainbow("\nAnd what's your github username?\n").cyan
    new_username = sanitize(gets.chomp)
    $this_student.github_username = new_username
    $this_student.save
  end

  # thanks/start message
  puts Rainbow("\nThanks, #{new_name}. Let's get started.").cyan
end
