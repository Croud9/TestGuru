class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :nullify
  has_many :users, through: :user_tests

  scope :easy, -> { where(level: (0..1)) }
  scope :middle, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  scope :test_by_category, ->(category) { joins(:category).where("categories.title = ?", category) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.tests_names_by_category(category)
    test_by_category(category).order(title: :desc).pluck(:title)
  end
end
