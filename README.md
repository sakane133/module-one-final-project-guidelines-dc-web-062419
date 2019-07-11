# Note Overflow
### By: Sam Kane & Leslie Sage

## Description
Note Overflow offers a command line interface for managing your Learn.co experience.  
This application will let you:
   * take notes on lessons
   * search your topics, lessons, repos, and notes
   * open repos from the console
   * open Learn.co from the console

## Instructions

1. Fork and clone this repository.
2. This app requires bundle, csv, and rainbow gems.  Run `bundle install` in the console before running program. 
3. Run `rake db:migrate` followed by `rake db:seed` in the console to set up your database.
4. Run the program by entering `ruby bin/run.rb` in the console.
5. If you don't use your real github user or you do not have a github account, the "r" (repo) feature will not work.  Use the "o" (original repo) feature instead to get the Learn.co repo.
6. If you try to open a non-existant repo, you will get a 404 error.




