class User < ApplicationRecord
  has_many :task_groups
  has_many :tasks, through: :task_groups
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :nationality, presence: true
end
