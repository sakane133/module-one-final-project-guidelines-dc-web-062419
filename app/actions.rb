module Actions < FoundLesson
  # This method takes in a lesson name and opens the Learn.co URL
  # in someone's browser of choice
  def learn
    request_lesson_name
    this_lesson
    url = @found_lesson.url
    system("open",url)
    menu
  end

  # takes in a lesson name and opens the student's repo
  # in their browser of choice
  def repo_learn
    request_lesson_name
    this_lesson
    url = "https://github.com/learn-co-students/#{@found_lesson.repo}"
    system("open",url)
    menu
  end

  # takes in a lesson name and opens the student's repo
  # in their browser of choice
  def repo
    request_lesson_name
    this_lesson
    url = "https://github.com/#{@this_student.github_username}/#{@found_lesson.repo}"
    system("open",url)
    menu
  end

  # finds lesson based on lesson title entered by user
  # takes note as input from user, saves note, prints "saved" message
  def take_note
    # get lesson for note
    request_lesson_name
    this_lesson
    # get note text for note
    puts Rainbow("\nPlease enter your note:\n").cyan
    entered_text = sanitize(gets.chomp)
    # save note
    Note.create(student_id: this_session.this_student.id, lesson_id: @found_lesson.id, note_text: entered_text)
    # print saved message
    note_responses = [
      "\nGreat, your note has been saved.",
      "\nYou're crushing it. Great note.",
      "\nNAILED IT. We've noted your note."
    ]
    puts Rainbow("#{note_responses.sample}
    ").yellow
    menu
  end
end
