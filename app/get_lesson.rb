require_relative '../config/environment'

# takes in name of lesson of interest, returns instance of lesson

def get_lesson
  puts "Which lesson?"
  lesson_name_for_note = gets.chomp
  $found_lesson = Lesson.find_by(title: lesson_name_for_note)
end
