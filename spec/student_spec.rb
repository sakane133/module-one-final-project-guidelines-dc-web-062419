require_relative 'spec_helper.rb'
require_relative '../lib/student.rb'

describe Student do

  before do
    @jane = Student.create(:name => 'Jane', :github_username => 'jane123')
    @note = Note.create(:student_id => @jane.id, :lesson_id => 1, :note_text => "Here's a test note")
  end

  after do
    Student.destroy(@jane.id)
    Note.destroy(@note.id)
  end

  it "can initialize a student" do
    expect(@jane).to be_a(Student)
  end

  it "initializes with a name" do
    expect(@jane.name).to eq("Jane")
  end

  it "initializes with a github username" do
    expect(@jane.github_username).to eq("jane123")
  end

  it "knows all the students" do
    Student.all.include?(@student)
  end

  it "gets a student's notes" do
    @jane.get_all_notes.include?(@note)
  end

end
