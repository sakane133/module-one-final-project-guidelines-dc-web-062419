require_relative "../app/search_notes.rb"

describe "search_notes" do

  before do
    @jane = Student.create(:name => 'Jane', :github_username => 'jane123')
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => 1, :url => "www.fakeurl.url", :repo => "learning-stuff")
    @learnings2 = Lesson.create(:title => 'Learning Stuff2', :topic_id => 1, :url => "www.fakeurl2.url", :repo => "learning-stuff2")
    @note = Note.create(:student_id => @jane.id, :lesson_id => @learnings2.id, :note_text => "Here's a test note")
  end

  after do
    Student.destroy(@jane.id)
    Lesson.destroy(@learnings.id)
    Lesson.destroy(@learnings2.id)
    Note.destroy(@note.id)
  end

  it "takes in a 'like' search string; returns lesson array with that string in an associated note" do
      search_notes("%a test%").include?(@learnings2)
  end

end
