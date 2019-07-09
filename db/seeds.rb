require './config/environment.rb'

sql = <<-SQL
  INSERT INTO topics (name)
  VALUES (?)
SQL
CSV.foreach("topics.csv", headers: true) do |row|
  DB[:conn].execute(sql,row.fields)
end

sql = <<-SQL
  INSERT INTO lessons (title, topic_id, url, repo )
  VALUES (?, ?, ?, ?)
SQL
CSV.foreach("lessons.csv", headers: true) do |row|
  DB[:conn].execute(sql,row.fields)
end

sql = <<-SQL
  INSERT INTO notes (student_id, lesson_id, note_text)
  VALUES (?, ?, ?)
SQL
CSV.foreach("notes.csv", headers: true) do |row|
  DB[:conn].execute(sql,row.fields)
end

sql = <<-SQL
  INSERT INTO students (name, github_username)
  VALUES (?, ?)
SQL
CSV.foreach("students.csv", headers: true) do |row|
  DB[:conn].execute(sql,row.fields)
end
