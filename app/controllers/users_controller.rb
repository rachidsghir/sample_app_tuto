class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      log_in @user
      flash[:success] = "Your subscription is successfuly saved"
      redirect_to @user
    else
      flash[:danger] = "Something wrong ... :("
      render "new"
    end
  end

  def show
    if !find_user
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def find_user
    @user = current_user
  end

end
