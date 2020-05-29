class User < ApplicationRecord
  rolify
  include UniversalIdentifiable
  belongs_to :academic_program, optional: true
  belongs_to :academic_departament, optional: true
  belongs_to :identification_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, :lastname, :code, :document_number, :contact_number, presence: true
  validates :code, :document_number, :contact_number, uniqueness: true
end
