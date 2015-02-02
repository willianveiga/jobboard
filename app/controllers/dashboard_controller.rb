class DashboardController < ApplicationController
  before_action :redirect_if_user_not_logged_in, :index

  def index
  end

  private
  def redirect_if_user_not_logged_in
    redirect_to users_login_path unless session[:user_id]
  end
end
