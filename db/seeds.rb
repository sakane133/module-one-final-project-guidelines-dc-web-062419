require './config/environment.rb'

CSV.foreach("topics.csv", headers: true) do |row|
  Topic.find_or_create_by(name: row[0])
end

CSV.foreach("lessons.csv", headers: true) do |row|
  Lesson.find_or_create_by(title: row[0], topic_id: row[1], url: row[2], repo: row[3])
end

CSV.foreach("notes.csv", headers: true) do |row|
  Note.find_or_create_by(student_id: row[0], lesson_id: row[1], note_text: row[2])
end

CSV.foreach("students.csv", headers: true) do |row|
  Student.find_or_create_by(name: row[0], github_username: row[1])
end
