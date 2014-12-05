require 'test_helper'

class UserAttemptsTest < ActiveSupport::TestCase
  test 'correct?' do
    assert UserAttempt.first.correct?
    assert_not UserAttempt.second.correct?
  end

  test 'to_s' do
    assert '[D]', UserAttempt.first.answers_to_s
  end
end
