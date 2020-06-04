class UserPolicy < ApplicationPolicy
  attr_reader :user, :user2

  def initialize(user, user2)
    @user = user
    @user2 = user2
  end

  def index?
    return true if user.has_role? :director_de_comite
  end

  def show?
    user.has_role? :director_de_comite or user.uuid == user2.uuid
  end

  def create?
    return true if user.has_role? :director_de_comite
  end

  def new?
    return true if user.has_role? :director_de_comite
  end

  def update?
    user.has_role? :director_de_comite or user.uuid == user2.uuid
  end

  def edit?
    user.has_role? :director_de_comite or user.uuid == user2.uuid
  end

  def destroy?
    return true if user.has_role? :director_de_comite
  end
end
