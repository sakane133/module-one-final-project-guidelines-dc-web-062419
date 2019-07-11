require_relative '../config/environment'

# finds lesson based on lesson title entered by user
# takes note as input from user, saves note
# prints "saved" message

def take_note

  # get lesson for note
  get_lesson

  # get note text for note
  puts Rainbow("\nPlease enter your note:\n").cyan
  entered_text = sanitize(gets.chomp)

  # save note
  Note.create(student_id: $this_student.id, lesson_id: $found_lesson.id, note_text: entered_text)

  # print saved message
  note_responses = [
    "\nGreat, your note has been saved.",
    "\nYou're crushing it. Great note.",
    "\nNAILED IT. We've noted your note."
  ]
  puts Rainbow("#{note_responses.sample}
  ").yellow
  menu
end
