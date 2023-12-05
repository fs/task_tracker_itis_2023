class UserPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def new?
    create?
  end

  def create?
    user.blank?
  end

  def destroy?
    user.present? && user.admin?
  end

  def admin?
    user.role == "admin" || user.role == "super_admin"
  end
end
