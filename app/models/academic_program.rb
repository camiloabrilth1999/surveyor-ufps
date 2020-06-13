class AcademicProgram < ApplicationRecord
  has_many :users
  has_many :students
  belongs_to :faculty
  validates :name, :code, :email, presence: true
  validates :code, :email, uniqueness: true
  before_destroy :destory_users

  private

  def destory_users
    User.where(academic_program_id: id).destroy_all
  end
end
