class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && owner?
  end

  def edit?
    user_is_member?
  end

  def show?
    true
  end

  def update?
    user.present? && user_is_member?
  end

  private

  def user_is_member?
    ProjectMembership.find_by(project: record, user: user).present?
  end

  def owner?
    ProjectMembership.find_by(project: record, user: user)&.owner?
  end

end