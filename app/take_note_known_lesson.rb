require_relative '../config/environment'

def take_note_known_lesson
  puts "Please enter your note:"
  note_text = gets.chomp
  Note.create(student_id,lesson_id,note_text)
end
