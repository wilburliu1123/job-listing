class Job < ApplicationRecord
  belongs_to :admin
  belongs_to :user
  validates :title, presence: true
end
