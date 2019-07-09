require_relative '../config/environment'

def take_note
  puts "What lesson do you want to take a note for?"
  lesson_name_for_note = gets.chomp
  lesson_id_lookup = Lesson.find_by(title: lesson_name_for_note).id
  puts "Please enter your note:"
  entered_text = gets.chomp
  Note.create(student_id: $this_student.id, lesson_id: lesson_id_lookup, note_text: entered_text)
  note_responses = [
    "Great, your note has been saved.",
    "You're crushing it. Great note.",
    "NAILED IT. We've noted your note."
  ]
  puts note_responses.sample
  puts ""
  menu
end
