class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def new?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    true
  end

  def edit?
    new?
  end

  def show?
    true
  end

  def update?
    true
  end
end
