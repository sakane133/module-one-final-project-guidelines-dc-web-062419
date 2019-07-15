require_relative "../app/modules/search.rb"
require_relative "../app/modules/sanitize.rb"
require_relative "../app/modules/print.rb"

describe "search" do

  let(:dummy_class) { Class.new { extend Search } }

  before do
    @info = Topic.create(:name => 'Information')
    @jane = Student.create(:name => 'Jane', :github_username => 'jane123')
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => @info.id, :url => "www.fakeurl.url", :repo => "learning-stuff")
    @learnings2 = Lesson.create(:title => 'Learning Stuff2', :topic_id => @info.id, :url => "www.fakeurl2.url", :repo => "learning-stuff2")
    @note = Note.create(:student_id => @jane.id, :lesson_id => @learnings2.id, :note_text => "Here's a test note")
  end

  after do
    Topic.destroy(@info.id)
    Student.destroy(@jane.id)
    Lesson.destroy(@learnings.id)
    Lesson.destroy(@learnings2.id)
    Note.destroy(@note.id)
  end

  it "takes in a 'like' search string; returns lesson array with that string in the title" do
    dummy_class.search_lesson("%Stuff2%").include?(@learnings2)
  end

  it "takes in a 'like' search string; returns lesson array with that string in an associated note" do
    dummy_class.search_notes("%a test%").include?(@learnings2)
  end

  it "takes in a 'like' search string; returns lesson array with that string in the repo" do
    dummy_class.search_repo("%-stuff2%").include?(@learnings2)
  end

  it "takes in a 'like' search string; returns lesson array with that string in the topic name" do
    dummy_class.search_topic("%Infor%").include?(@learnings)
  end

end
