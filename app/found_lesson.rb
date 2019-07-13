# takes in name of lesson of interest, returns instance of lesson

class FoundLesson < Cli
  def initialize
    puts Rainbow("\nWhich lesson? (Type \"m\" for menu or \"q\" to quit.)\n").cyan
    # get user input for lesson to find
    @lesson_name_for_action = sanitize(gets.chomp).downcase
  end
  def this_lesson
    # return results, give another chance, or exit search
    if
      @lesson_name_for_action == "m"
      menu
    elsif @lesson_name_for_action == "q"
      quit
    else
      # if found, set found_lesson to instance of Lesson object
      case_hash = {}
      Lesson.all.each {|l| case_hash[l.title.downcase] = l.title}
      @found_lesson = Lesson.find_by(title: case_hash[@lesson_name_for_action])
      if @found_lesson.nil?
        puts Rainbow("\nThat doesn't match any lesson name.").red
        puts Rainbow("\nTry again, or type \"m\" for menu or \"q\" to quit.)\n").cyan
        this_lesson
      else
        @found_lesson
      end
    end
  end
end
