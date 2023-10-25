class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    project_membership.present?
  end

  def index?
    true
  end

  def edit?
    project_membership.present?
  end

  def new?
    project_membership.present?
  end

  def create?
    project_membership.present?
  end

  def update?
    project_membership.present?
  end

  def destroy?
    owner?
  end

  private

  def project_membership
    @project_membership ||= ProjectMembership.find_by(project: record.project, user: user)
  end

  def owner?
    project_membership&.owner?
  end
end
