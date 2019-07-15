require './config/environment.rb'

class Lesson < ActiveRecord::Base
  has_many :notes
  belongs_to :topic
  has_many :students
end
