class Answer < ActiveRecord::Base
  belongs_to :question

  validates :text, presence: true
  validates :correctness, inclusion: { in: [true, false] }

  scope :correct, -> { where(correctness: true) }
  scope :incorrect, -> { where(correctness: false) }

  def to_s
    option ? "#{option}. #{text}\n" : text
  end
end
