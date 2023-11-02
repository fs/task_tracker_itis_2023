class SessionPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    user.blank?
  end

  def show?
    user.present?
  end

  def destroy?
    user.present?
  end

end