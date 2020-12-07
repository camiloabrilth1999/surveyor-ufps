class AcademicDepartamentPolicy < ApplicationPolicy
  attr_reader :user, :academic_program

  def initialize(user, academic_program)
    @user = user
    @academic_program = academic_program
  end

  def index?
    return true if user.has_role? :director_de_comite
  end

  def show?
    return true if user.has_role? :director_de_comite
  end

  def create?
    return true if user.has_role? :director_de_comite
  end

  def new?
    return true if user.has_role? :director_de_comite
  end

  def update?
    return true if user.has_role? :director_de_comite
  end

  def edit?
    return true if user.has_role? :director_de_comite
  end

  def destroy?
    return true if user.has_role? :director_de_comite
  end
end
