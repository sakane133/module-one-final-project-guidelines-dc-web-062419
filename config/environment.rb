require 'bundler'
Bundler.require
require 'nokogiri'
require 'open_uri_redirections'
require 'pry'
require 'csv'
require 'rainbow'
require_all 'lib'
require_all 'app'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/note_overflow.db')

DB = {:conn => SQLite3::Database.new('./db/note_overflow.db')}
ActiveRecord::Base.logger = nil
