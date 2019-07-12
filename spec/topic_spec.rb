require_relative 'spec_helper.rb'
require_relative '../lib/topic.rb'

describe Topic do

  before do
    @info = Topic.create(:name => 'Information')
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => @info.id, :url => "www.fakeurl.url", :repo => "learning-stuff")
  end

  after do
    Topic.destroy(@info.id)
    Lesson.destroy(@learnings.id)
  end

  it "can initialize a topic" do
    expect(@info).to be_a(Topic)
  end

  it "initializes with a name" do
    expect(@info.name).to eq("Information")
  end


  it "knows all the topics" do
    Topic.all.include?(@info)
  end

end
