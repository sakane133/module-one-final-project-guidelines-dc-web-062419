module Print
  # returns a string of a lesson's notes concatenated using " // "
  def note_collection(lesson)
    note_array = Note.all.select {|note| note.lesson_id == lesson.id && note.student_id == this_student.id}
    note_text_array = note_array.map {|n| n.note_text}
    note_text_array.join(" // ")
  end
  # print out rows of lessons with color-coded lesson info
  def print(lesson_subset)
    lesson_subset.map {|lesson|
      Rainbow("\n#{lesson.topic.name}").yellow +
      Rainbow(" :: #{lesson.title} :: ").white +
      Rainbow("#{lesson.repo}").green +
      Rainbow("\n    #{note_collection(lesson)}").white
    }
  end
end
