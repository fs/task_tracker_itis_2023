class SessionsController < ApplicationController
  before_action :authenticate_current_user!, only: %i[show destroy]

  def show
    authorize! current_user
  end

  def new
    @user = User.new
    authorize! @user
  end

  def create
    @user = User.find_by(email: user_params[:email])
                &.authenticate(user_params[:password])

    if @user
      authorize! @user
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "You've successfully logged in!"
    else
      @user = User.new
      @user.errors.add :base, "Wrong email or password"
      authorize! @user
      render :new
    end
  end

  def destroy
    authorize! current_user

    if current_user
      session.delete(:current_user_id)
      redirect_to root_path, notice: "You've successfully logged out!"
    else
      redirect_to root_path, alert: "You are not logged in."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
