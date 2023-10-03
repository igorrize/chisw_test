class Contractor < ApplicationRecord
  has_many :assignments

  validates :name, presence: true
  validates :salary, presence: true
end
