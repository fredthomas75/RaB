class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

   def update?
    user_is_owner?
  end

  def edit?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    return record.user_id == user
  end
  # record c'est le bateau
end
