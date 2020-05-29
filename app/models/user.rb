class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include UniversalIdentifiable
  belongs_to :academic_program
  belongs_to :academic_departament
  belongs_to :identification_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, :lastname, :code, :document_number, :contact_number, presence: true
  validates :code, :document_number, :contact_number, uniqueness: true
end
