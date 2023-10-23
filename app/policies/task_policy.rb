class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true
  def show?
    project_membership.present?
  end

  def index?
    project_member_index.present?
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

  def project_member_index
    @project_membership_index ||= ProjectMembership.find_by(project: record.first.project, user: user)
  end

  def owner?
    project_membership&.owner?
  end

  def record
    @record ||= Task.find(params[:id])
  end

end