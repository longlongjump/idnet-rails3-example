class UserSessionController < ApplicationController
  before_filter :require_user, :only => :destroy

  def new
   render 'login' 
  end

  def create
    @user = User.create_from_auth_hash(auth_hash)

    session[:user_id] = @user.id
    redirect_to @user
  end

  def failure
    flash[:notice] = "Fail to register user"
    redirect_to '/'
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
