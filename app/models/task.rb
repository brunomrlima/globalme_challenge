class Task < ApplicationRecord
  has_many :task_groups
  has_many :users, through: :task_groups
  validates :title, presence: true
end
