require './config/environment.rb'

class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
    end
    create_table :lessons do |t|
      t.string :title
      t.integer :topic_id
      t.string :url
      t.string :repo
    end
    create_table :notes do |t|
      t.integer :student_id
      t.integer :lesson_id
      t.string :note_text
    end
    create_table :students do |t|
      t.string :name
      t.string :github_username
    end
  end
end
