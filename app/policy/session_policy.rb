class SessionPolicy < ApplicationPolicy
    authorize :user, allow_nil: true
    def new?
      user.blank?
    end
  
    def create?
      user.blank?
    end
  
    def destroy?
      user.present?
    end
  
    def show?
      user.present?
    end
  end