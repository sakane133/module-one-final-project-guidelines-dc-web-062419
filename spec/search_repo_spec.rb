require_relative "../app/search_repo.rb"

describe "search_repo" do

  before do
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => 1, :url => "www.fakeurl.url", :repo => "learning-stuff")
    @learnings2 = Lesson.create(:title => 'Learning Stuff2', :topic_id => 1, :url => "www.fakeurl2.url", :repo => "learning-stuff2")
  end

  after do
    Lesson.destroy(@learnings.id)
    Lesson.destroy(@learnings2.id)
  end

  it "takes in a 'like' search string; returns lesson array with that string in the repo" do
      search_repo("%-stuff2%").include?(@learnings2)
  end

end
