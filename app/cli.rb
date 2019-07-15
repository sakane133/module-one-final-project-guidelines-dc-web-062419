require_relative '../config/environment'
require_relative './modules/sanitize.rb'

class Cli
  include Menu
  include Sanitize
  include Actions
  include FoundLesson
  include Search
  include Print
  include Quit

  attr_accessor :this_student

  def initialize
    puts Rainbow("    =========================
    Welcome to Note Overflow!
    =========================

    Note Overflow offers a command line interface for
    managing your Learn.co experience.

    This application will let you:
     * take notes on lessons
     * search your topics, lessons, repos, and notes
     * open repos from the console
     * open Learn.co from the console

    To begin, what's your name?\n").cyan
    # take input from user
    name_provided = sanitize(gets.chomp)
    # find or create new instance of student
    @this_student = Student.find_or_create_by(name: name_provided)
  end

  def get_username
    # if this student doesn't exist yet in the db (has no repo),
    # create the student in the db and save their deets
    if this_student.github_username.nil?
      puts Rainbow("\n  And what's your github username?\n").cyan
      new_username = sanitize(gets.chomp)
      puts Rainbow("\n  Thanks, #{this_student.name}. Let's get started.").cyan
      this_student.github_username = this_student
      this_student.save
    end
  end

  def run
    menu
  end
end
