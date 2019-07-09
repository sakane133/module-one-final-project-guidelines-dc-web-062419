require_relative '../config/environment'

def take_note
  get_lesson
  puts "Please enter your note:"
  entered_text = gets.chomp
  Note.create(student_id: $this_student.id, lesson_id: $found_lesson.id, note_text: entered_text)
  note_responses = [
    "Great, your note has been saved.",
    "You're crushing it. Great note.",
    "NAILED IT. We've noted your note."
  ]
  puts note_responses.sample
  puts ""
  menu
end
