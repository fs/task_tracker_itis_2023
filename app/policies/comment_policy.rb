class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    project_membership?
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

  def project_membership?
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end

  def owner?
    @owner ||= Comment.find_by(user: user)
  end
end
