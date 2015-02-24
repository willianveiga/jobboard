class BackendController < ApplicationController
  include Loggable

  def index
    user = User.find session[:user_id]
    redirect_to company_profile_path unless user.company
  end
end
