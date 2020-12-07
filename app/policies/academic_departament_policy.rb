class AcademicDepartamentPolicy < ApplicationPolicy
  attr_reader :user, :academic_departament

  def initialize(user, academic_departament)
    @user = user
    @academic_departament = academic_departament
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
