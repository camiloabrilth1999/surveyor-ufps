class StudentPolicy < ApplicationPolicy
  attr_reader :user, :student

  def initialize(user, student)
    @user = user
    @student = student
  end

  def index?
    return true if user.has_role? :director_de_programa
  end

  def import?
    return true if user.has_role? :director_de_programa
  end

  def index_semester?
    return true if user.has_role? :director_de_programa
  end

  def index_semester_post?
    return true if user.has_role? :director_de_programa
  end
end
