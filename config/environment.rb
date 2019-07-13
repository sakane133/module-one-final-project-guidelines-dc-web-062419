require 'bundler'
Bundler.require
require 'csv'
require 'rainbow'
require_all './lib'
require_all './app'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: './db/note_overflow.db')

ActiveRecord::Base.logger = nil
