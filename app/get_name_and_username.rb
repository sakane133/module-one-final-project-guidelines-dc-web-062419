require_relative '../config/environment'

def get_name_and_username
  puts Rainbow("To begin, what's your name?\n").cyan
  new_name = sanitize(gets.chomp)
  $this_student = Student.find_or_create_by(name: new_name)
  if $this_student.github_username.nil?
    puts Rainbow("\nAnd what's your github username?\n").cyan
    new_username = sanitize(gets.chomp)
    $this_student.github_username = new_username
    $this_student.save
  end
  puts Rainbow("\nThanks, #{new_name}. Let's get started.").cyan
end
