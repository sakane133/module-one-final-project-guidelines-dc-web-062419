require_relative 'spec_helper.rb'
require_relative '../lib/note.rb'

describe Note do

  before do
    @jane = Student.create(:name => 'Jane', :github_username => 'jane123')
    @note = Note.create(:student_id => @jane.id, :lesson_id => 1, :note_text => "Here's a test note")
  end

  after do
    Student.destroy(@jane.id)
    Note.destroy(@note.id)
  end

  it "can initialize a note" do
    expect(@note).to be_a(Note)
  end

  it "initializes with a lesson id" do
    expect(@note.lesson_id).to eq(1)
  end

  it "initializes with a student id" do
    expect(@note.student_id).to eq(@jane.id)
  end

  it "initializes with note text" do
    expect(@note.note_text).to eq("Here's a test note")
  end

  it "knows all the notes" do
    Note.all.include?(@note)
  end

end
