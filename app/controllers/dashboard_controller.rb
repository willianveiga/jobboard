class DashboardController < ApplicationController
  before_action :redirect_if_user_not_logged_in, :index
  before_action :set_user, :index
  layout 'dashboard'

  def index
  end

  private
  def redirect_if_user_not_logged_in
    redirect_to users_login_path unless session[:user_id]
  end

  def set_user
    @user = User.find(session[:user_id])
    @company = @user.company
  end
end
