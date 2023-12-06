# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  authorize :user, allow_nil: true
  def new?
    user.blank?
  end

  def create?
    user.blank?
  end
end