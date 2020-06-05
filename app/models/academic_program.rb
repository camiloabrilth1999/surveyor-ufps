class AcademicProgram < ApplicationRecord
  has_many :users
  has_many :students
  belongs_to :faculty
  validates :name, :code, :email, presence: true
  validates :code, :email, uniqueness: true
end
