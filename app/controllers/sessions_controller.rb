class SessionsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
