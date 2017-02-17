class SessionsController < ApplicationController
  before_action :require_no_user!, only: [:create, :new]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    unless user.nil?
      login_user!(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
      # redirect_to new_session_url if flash[:errors], lose instance variables
    end
  end

  def destroy
    logout_user!
  end
end
