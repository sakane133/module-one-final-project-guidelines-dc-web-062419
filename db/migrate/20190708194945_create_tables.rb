require './config/environment.rb'

class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :topic
    end
    create_table :lessons do |t|
      t.string :lesson
      t.integer :topic_id
      t.string :url
      t.string :repo
    end
    create_table :notes do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.text :note
    end
    create_table :users do |t|
      t.string :name
      t.string :github_username
    end
  end
end
