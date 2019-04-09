class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user && record.published || user_admin?
  end

  def create?
    user_admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  private

  def user_admin?
    user.admin
  end
end
