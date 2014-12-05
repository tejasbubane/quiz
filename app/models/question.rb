class Question < ActiveRecord::Base
  has_many :answers

  validates :text, presence: true
  validates :has_options, inclusion: { in: [true, false] }

  def correct_options
    @correct_options ||= if has_options
                           answers.correct.pluck(:option)
                         else
                           answers.correct.pluck(:text)
                         end
  end

  def incorrect_options
    @incorrect_options ||= if has_options
                             answers.incorrect.pluck(:option)
                           else
                             answers.incorrect.pluck(:text)
                           end
  end

  def correct_options_to_s
    correct_options.to_s.gsub('"', '')
  end

  def to_s
    str = "Question #{id}\n#{text}\n"
    answers.each { |answer| str += answer.to_s } if has_options
    str
  end
end
