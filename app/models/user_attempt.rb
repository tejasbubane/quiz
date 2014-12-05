class UserAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def correct?
    @correct ||= (question.correct_options == answers)
  end

  def answers_to_s
    answers.to_s.gsub('"', '')
  end
end
