require_relative '../config/environment'

# takes in a user input and replaces escaped characters

def sanitize(user_input)
  user_input.gsub("/","")
end
