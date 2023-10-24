class UsersController < ApplicationController
  def new
    @user = User.new

    authorize @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      render :new
    end

    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
