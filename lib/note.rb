require './config/environment.rb'

class Note < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson
end
