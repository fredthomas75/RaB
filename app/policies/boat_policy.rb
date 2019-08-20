class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def update?
    return user_is_owner?
  end

  def destroy?
    return user_is_owner?
  end

  private

  def user_is_owner?
    return record.user_id == user
  end
  # record c'est le bateau
end
