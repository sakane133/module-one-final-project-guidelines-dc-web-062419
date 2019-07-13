require './config/environment.rb'

class Student < ActiveRecord::Base
  has_many :lessons
  has_many :notes
  has_many :topics, through: :lessons

  # returns an array of instances of the Note class that belong to a student
  def get_all_notes
    Note.where(student_id: self.id)
  end
end
