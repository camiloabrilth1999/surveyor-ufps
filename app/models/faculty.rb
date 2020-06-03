class Faculty < ApplicationRecord
  has_many :academic_programs, dependent: :destroy
  has_many :academic_departaments, dependent: :destroy
  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
