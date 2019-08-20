class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def inrdex?
    return user_is_owner?
  end

  def show?
    return user_is_owner?
  end

  def create?
    return user_is_owner?
  end

  def new?
    create?
  end

  def update?
    return user_is_owner?
  end

  def edit?
    update?
  end

  def destroy?
    return user_is_owner?
  end

  private

  def user_is_owner?
    return record.user_id == user
  end
end
