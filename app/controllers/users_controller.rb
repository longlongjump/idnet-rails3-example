class UsersController < ApplicationController
  before_filter :require_user

  def show
    render :action => :show
  end

end
