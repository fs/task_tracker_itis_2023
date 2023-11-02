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
    owner?
  end

  def edit?
    project_membership.present?
  end

  def show?
    project_membership.present?
  end

  def update?
    project_membership.present?
  end

  private

  def project_membership
    @project_membership ||= ProjectMembership.find_by(project: record, user: user)
  end

  def owner?
    project_membership&.owner?
  end
end
