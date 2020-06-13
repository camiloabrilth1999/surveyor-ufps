class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include UniversalIdentifiable
  belongs_to :academic_program, optional: true
  belongs_to :academic_departament, optional: true
  belongs_to :identification_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:code, :document_number]

  validates :email, :name, :lastname, :code, :document_number, :contact_number, presence: true
  validates :code, :document_number, :email, :contact_number, :academic_program_id, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
