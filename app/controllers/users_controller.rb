class UsersController < ApplicationController
  def login
    redirect_to dashboard_path if session[:user_id]
  end

  def auth
    user = User.authenticate params[:username], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to users_login_path, notice: 'The username or password you entered is incorrect.'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to users_login_path, notice: 'You have successfully logged out.'
  end
end
