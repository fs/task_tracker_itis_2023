class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    member?
  end

  def index?
    member?
  end

  def edit?
    member?
  end

  def new?
    member?
  end

  def create?
    member?
  end

  def update?
    member?
  end

  def destroy?
    member?
  end

  private

  def member?
    ProjectMembership.find_by(project: record.project, user: user).present?
  end
end