class BackendController < ApplicationController
  def index
    redirect_to signin_path unless session[:user_id]
  end
end
