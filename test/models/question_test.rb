require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.first
  end

  test 'correct_options' do
    assert %w(D), @question.correct_options
  end

  test 'incorrect_options' do
    assert %w(A B C), @question.incorrect_options
  end

  test 'correct_options_to_s' do
    assert '[A]', @question.correct_options_to_s
  end

  test 'to_s' do
    result = "Question 1\n"\
    "Capital of India is\n"
    "A. Bombay\n"\
    "B. Calcutta\n"\
    "C. Madras\n"\
    "D. New Delhi\n"

    assert result, @question.to_s
  end
end
