require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = Answer.first
  end

  test 'to_s' do
    result = 'A. Bombay'

    assert result, @answer.to_s
  end
end
