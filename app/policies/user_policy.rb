class UserPolicy < ApplicationPolicy

  def register?
    !user
  end

  def login?
    !user
  end

  def profile?
    user
  end

end
