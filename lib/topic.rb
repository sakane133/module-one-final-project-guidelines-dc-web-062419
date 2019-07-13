require './config/environment.rb'

class Topic < ActiveRecord::Base
  has_many :lessons
  has_many :students, through: :lessons
  has_many :notes, through: :lessons
end
