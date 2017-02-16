class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    render :new
    #sign up page
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to bands_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
