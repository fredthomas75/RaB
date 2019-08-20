class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def inrdex?
    return user_is_logged_in
  end

  def show?
    return user_is_logged_in?
  end

  def create?
    return user_is_logged_in?
  end

  def new?
    create?
  end

  def update?
    return user_is_logged_in?
  end

  def edit?
    update?
  end

  def destroy?
    return user_is_logged_in?
  end

  private

  def user_is_logged_in?
    return current_user
  end
end
