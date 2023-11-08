class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true
  def index?
    true
  end

  def show?
    true
  end

  def new?
    project_membership_and_user_present?
  end

  def create?
    project_membership_and_user_present?
  end

  def edit?
    project_membership_and_user_present?
  end

  def update?
    project_membership_and_user_present?
  end

  def destroy?
    project_membership_and_user_present?
  end

  private

  def project_membership
    @project_membership ||= ProjectMembership.find_by(project: record.project, user: user)
  end

  def project_membership_and_user_present?
    project_membership.present? && user.present?
  end
end
