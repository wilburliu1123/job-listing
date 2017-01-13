class Job < ApplicationRecord

  validates :title, presence: true
  validates :wage_uppper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numerically: { greater_than: 0}
end
