# takes in a search string formatted for SQL "like" search
# returns set of lessons where the search string appears in the notes text

def search_notes(like_search_string)
  note_set = Note.where("note_text LIKE ?", like_search_string)
  filtered_note_set = note_set.select {|n| n.student_id == $this_student.id}
  lesson_id_set = filtered_note_set.map {|n| n.lesson_id}
  note_search = lesson_id_set.map {|lid| Lesson.find(lid)}
end
