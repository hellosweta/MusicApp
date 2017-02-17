class UsersController < ApplicationController
  before_action :require_no_user!
  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
    #sign up page
  end

  def create

    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new

    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
