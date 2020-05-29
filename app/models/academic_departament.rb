class AcademicDepartament < ApplicationRecord
  has_many :users
  belongs_to :faculty
  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
