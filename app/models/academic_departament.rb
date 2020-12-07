class AcademicDepartament < ApplicationRecord
  has_many :users
  has_many :teachers
  belongs_to :faculty
  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
