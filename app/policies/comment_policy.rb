class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    member?
  end

  def destroy?
    owner?
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  private

  def member?
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end

  def owner?
    @owner ||= Comment.find_by(user: user)
  end
end
