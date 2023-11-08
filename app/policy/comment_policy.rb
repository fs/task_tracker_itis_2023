class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    project_membership_and_user_present?
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def project_membership
    @project_membership ||= ProjectMembership.find_by(project: record.task.project, user: user)
  end

  def owner?
    @comment ||= Comment.find_by(user: user)
  end

  def project_membership_and_user_present?
    project_membership.present? && user.present?
  end
end
