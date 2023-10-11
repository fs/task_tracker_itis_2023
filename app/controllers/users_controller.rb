class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      redirect_to new_user_path
      flash[:notice] = @user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
