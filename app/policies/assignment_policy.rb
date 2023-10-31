class AssignmentPolicy < ApplicationPolicy
# Only project participants can interact with assignments

def create?
  user && user.projects.include?(record.project)
end

def update?
  user && user.projects.include?(record.project)
end

def destroy?
  user && user.projects.include?(record.project)
end

end
