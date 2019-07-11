require_relative '../config/environment'

# prints greeting and menu of options

def greeting
  puts Rainbow("  =========================
  Welcome to Note Overflow!
  =========================

  Note Overflow offers a command line interface for
  managing your Learn.co experience.

  This application will let you:
   * take notes on lessons
   * search your topics, lessons, repos, and notes
  ").cyan
end
