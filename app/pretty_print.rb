require_relative '../config/environment'

# print out rows of lessons with color-coded lesson info

def pretty_print(lesson_subset)
  lesson_subset.map {|lesson|
    Rainbow("\n#{lesson.topic.name}").yellow +
    Rainbow(" :: #{lesson.title} :: ").white +
    Rainbow("#{lesson.repo}").green +
    Rainbow("\n    #{lesson.note_collection}").white
  }
end
