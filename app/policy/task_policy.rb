class TaskPolicy < ApplicationPolicy

    authorize :user, allow_nil: true
  
    def show?
      user_is_member?
    end
  
    def index?
      true
    end
  
    def edit?
      user_is_member?
    end
  
    def new?
      user_is_member?
    end
  
    def create?
      user_is_member?
    end
  
    def update?
      user_is_member?
    end
  
    def destroy?
      user_is_member?
    end
  
    private
  
    def user_is_member?
      ProjectMembership.find_by(project: record.project, user: user).present?
    end
  
  end