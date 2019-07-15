require_relative "../app/modules/print.rb"

describe "search_repo" do

  before do
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => 1, :url => "www.fakeurl.url", :repo => "learning-stuff")
    @learnings2 = Lesson.create(:title => 'Learning Stuff2', :topic_id => 1, :url => "www.fakeurl2.url", :repo => "learning-stuff2")
  end

  after do
    Lesson.destroy(@learnings.id)
    Lesson.destroy(@learnings2.id)
  end

  it "gets a lesson's notes" do
    expect(note_collection(@learnings)).to eq("#{@note.note_text} // #{@note2.note_text}")
  end

end
