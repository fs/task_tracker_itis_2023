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
    member?
  end

  def show?
    member?
  end

  def update?
    member?
  end

  private

  def member?
    ProjectMembership.find_by(project: record, user: user).present?
  end

  def owner?
    #TODO owner of proj?
  end
end
