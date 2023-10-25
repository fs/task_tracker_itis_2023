class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true
  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    owner?
  end

  def edit?
    project_participation?
  end

  def show?
    true
  end

  def update?
    project_participation?
  end

  private

  def project_membership
    @project_membership ||= ProjectMembership.find_by(project: record, user: user)
  end

  def project_participation?
    project_membership.present?
  end

  def owner?
    project_membership&.owner?
  end
end
