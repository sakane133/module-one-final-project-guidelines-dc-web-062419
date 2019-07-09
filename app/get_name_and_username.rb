require_relative '../config/environment'

def get_name_and_username
  puts "To begin, what's your name?"
  new_name = gets.chomp
  $this_student = Student.find_or_create_by(name: new_name)
  if $this_student.github_username.nil?
    puts "And what's your github username?"
    new_username = gets.chomp
    $this_student.github_username = new_username
    $this_student.save
  end
  puts "Thanks, #{new_name}. Let's get started."
end
