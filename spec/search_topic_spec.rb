require_relative "../app/search_topic.rb"

describe "search_topic" do

  before do
    @info = Topic.create(:name => 'Information')
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => @info.id, :url => "www.fakeurl.url", :repo => "learning-stuff")
  end

  after do
    Topic.destroy(@info.id)
    Lesson.destroy(@learnings.id)
  end

  it "takes in a 'like' search string; returns lesson array with that string in the topic name" do
    search_topic("%Infor%").include?(@learnings)
  end

end
