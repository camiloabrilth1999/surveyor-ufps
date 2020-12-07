class TeacherPolicy < ApplicationPolicy
  attr_reader :user, :teacher

  def initialize(user, teacher)
    @user = user
    @teacher = teacher
  end

  def index?
    return true if user.has_role? :director_de_programa
  end

  def import?
    return true if user.has_role? :director_de_programa
  end
end
