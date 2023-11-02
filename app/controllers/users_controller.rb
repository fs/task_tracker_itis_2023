class UsersController < ApplicationController
  def new
    @user = User.new
    authorize! User
  end

  def create
    @user = User.new(user_params)
    authorize! User

    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end