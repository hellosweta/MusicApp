class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_user_credentials(params[:user][:email], params[:user][:password])
    if @user
      @user.reset_session_token
      session[:sesssion_token] = @user.session_token
      redirect_to user_url
    else
      redirect_to new_session_url
    end
  end

end
