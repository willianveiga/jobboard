class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new user_params
    respond_to do |format|
      captcha_message = 'Incorrect CAPTCHA data. Please try again.'
      if !verify_recaptcha(model: @user, message: captcha_message) || !@user.save(context: :create)
        format.html { render :signup }
      else
        UserMailer.activate(@user).deliver_later
        format.html { redirect_to :user_created }
      end
    end
  end

  def created
  end

  def signin
    redirect_to backend_path if session[:user_id]
  end

  def auth
    user = User.auth params[:name], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to backend_path
    else
      redirect_to signin_path, notice: 'The username or password you entered is incorrect.'
    end
  end

  def activate
    begin
      @user = User.activate params[:activation_code]
      @success = true
    rescue ActiveRecord::RecordNotFound
      @success = false
    end
  end

  private
  def user_params
    params.require(:user)
      .permit(:name, :password, :password_confirmation, :email)
  end
end
