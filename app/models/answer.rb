class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    errors.add(:base, 'You can have from 1 to 4 responses') if question.answers.count > 4
  end
end
