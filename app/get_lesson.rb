require_relative '../config/environment'

# takes in name of lesson of interest, returns instance of lesson

def get_lesson
  puts Rainbow("\nWhich lesson?\n").cyan
  lesson_name_for_note = sanitize(gets.chomp)
  found_lesson = Lesson.find_by(title: lesson_name_for_note)
  if found_lesson.nil?
    puts Rainbow("\nThat doesn't match any lesson name.\n").red
    menu
  else
    $found_lesson = found_lesson
  end
end
