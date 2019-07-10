require_relative '../config/environment'

def take_note
  get_lesson
  puts Rainbow("\nPlease enter your note:\n").cyan
  entered_text = sanitize(gets.chomp)
  Note.create(student_id: $this_student.id, lesson_id: $found_lesson.id, note_text: entered_text)
  note_responses = [
    "\nGreat, your note has been saved.",
    "\nYou're crushing it. Great note.",
    "\nNAILED IT. We've noted your note."
  ]
  puts Rainbow("#{note_responses.sample}
  ").yellow
  menu
end
