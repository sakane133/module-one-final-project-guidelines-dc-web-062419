# takes in a user input and replaces escaped characters
module Sanitize
  def sanitize(user_input)
    user_input.gsub("/","")
  end
end
