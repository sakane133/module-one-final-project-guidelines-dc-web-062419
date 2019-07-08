require 'bundler'
Bundler.require
# require 'nokogiri'
require 'open-uri'
require 'pry'

DB = ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/note_overflow.db')
require_all 'lib'
