class UserPolicy < ApplicationPolicy

  authorize :user, allow_nil: true

  def new?
    true
  end

  def create?
    user.present? == false
  end

  def show?
    user.present?
  end

  def destroy?
    user.present?
  end


end
