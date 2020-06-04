class FacultyPolicy < ApplicationPolicy
  attr_reader :user, :faculty

  def initialize(user, faculty)
    @user = user
    @faculty = faculty
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
