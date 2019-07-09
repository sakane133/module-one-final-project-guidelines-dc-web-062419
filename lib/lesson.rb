require "./config/environment.rb"

class Lesson < ActiveRecord::Base
  def topic_name
    self.topic_id.topic
  end
  def note_collection
    note_array = []
    note_array << Note.all.select {|note| note.lesson_id = self.id}
    note_array.map {|note| note.note}
    note_array.join(" // ")
  end
end
