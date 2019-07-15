# exits program, puts goodbye message

module Quit
  def quit
    puts Rainbow("\nNote Overflow is very sad to see you go!\n").yellow
    exit
  end
end
