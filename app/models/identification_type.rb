class IdentificationType < ApplicationRecord
  has_many :users
  has_many :students
  validates :description, :summary_description, presence: true
  validates :summary_description, uniqueness: true
end
