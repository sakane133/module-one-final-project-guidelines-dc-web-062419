require_relative '../config/environment'
require_relative './cli.rb'


this_session = Cli.new
this_session.get_username
this_session.run
