class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    member?
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

  def owner?
    comment?
  end

  def comment?
    @comment ||= Comment.find_by(user: user)
  end

  def member?
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end
end
