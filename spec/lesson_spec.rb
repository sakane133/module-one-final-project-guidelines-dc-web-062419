require_relative 'spec_helper.rb'
require_relative '../lib/lesson.rb'

describe Lesson do

  before do
    @jane = Student.create(:name => 'Jane', :github_username => 'jane123')
    $this_student = @jane
    @learnings = Lesson.create(:title => 'Learning Stuff', :topic_id => 1, :url => "www.fakeurl.url", :repo => "learning-stuff")
    @note = Note.create(:student_id => @jane.id, :lesson_id => @learnings.id, :note_text => "Here's a test note")
    @note2 = Note.create(:student_id => @jane.id, :lesson_id => @learnings.id, :note_text => "Here's another test note")
  end

  after do
    Student.destroy(@jane.id)
    Lesson.destroy(@learnings.id)
    Note.destroy(@note.id)
    Note.destroy(@note2.id)
  end

  it "can initialize a lesson" do
    expect(@learnings).to be_a(Lesson)
  end

  it "initializes with a title" do
    expect(@learnings.title).to eq("Learning Stuff")
  end

  it "initializes with a topic_id" do
    expect(@learnings.topic_id).to eq(1)
  end

  it "initializes with a url" do
    expect(@learnings.url).to eq("www.fakeurl.url")
  end

  it "initializes with a repo" do
    expect(@learnings.repo).to eq("learning-stuff")
  end

  it "knows all the lessons" do
    Lesson.all.include?(@learnings)
  end

  it "gets a lesson's notes" do
    expect(@learnings.note_collection).to eq("#{@note.note_text} // #{@note2.note_text}")
  end

end
