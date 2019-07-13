require './config/environment.rb'

class Lesson < ActiveRecord::Base
  has_many :notes
  belongs_to :topic
  has_many :students

  # returns a string of a lesson's notes concatenated using " // "
  def note_collection
    note_array = Note.all.select {|note| note.lesson_id == self.id && note.student_id == $this_student.id}
    note_text_array = note_array.map {|n| n.note_text}
    note_text_array.join(" // ")
  end
end
