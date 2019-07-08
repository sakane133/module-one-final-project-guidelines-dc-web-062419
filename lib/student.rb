require "./config/environment.rb"

class Student < ActiveRecord::Base
  def get_all_notes
    Note.where(student_id: self.id)
  end
end
