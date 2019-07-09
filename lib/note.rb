require "./config/environment.rb"

class Note < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson
  # attr_accessor :student_id, :lesson_id, :note_text
end
