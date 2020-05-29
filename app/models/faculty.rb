class Faculty < ApplicationRecord
  has_many :academic_programs
  has_many :academic_departaments
  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
