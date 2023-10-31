class ProjectPolicy < ApplicationPolicy
# Anyone can see the list and the project page itself
  def index?
    true
  end

  def show?
    true
  end

  # Only logged in users can create a project
  def create?
    user
  end

  # Only project participants can update the project
  def update?
    user && user.projects.include?(record)
  end

  # Only the owner can delete a project
  def destroy?
    user && user == record.owner
  end
end
