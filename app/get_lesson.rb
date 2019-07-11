require_relative '../config/environment'

# takes in name of lesson of interest, returns instance of lesson

def get_lesson
  # get user input for lesson to find
  puts Rainbow("\nWhich lesson? (Type \"m\" for menu or \"q\" to quit.)\n").cyan
  lesson_name_for_note = sanitize(gets.chomp).downcase

  # if found, set found_lesson to instance of Lesson object
  case_hash = {}
  Lesson.all.each {|l| case_hash[l.title.downcase] = l.title}
  found_lesson = Lesson.find_by(title: case_hash[lesson_name_for_note])

  # return results, give another chance, or exit search
  if
    lesson_name_for_note == "m"
    menu
  elsif lesson_name_for_note == "q"
    quit
  elsif found_lesson.nil?
      puts Rainbow("\nThat doesn't match any lesson name.\n").red
      get_lesson
  else
    $found_lesson = found_lesson
  end
end
