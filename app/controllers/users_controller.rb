class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create_user
    @user = User.new user_params
    respond_to do |format|
      captcha_message = 'Incorrect CAPTCHA data. Please try again.'
      if !verify_recaptcha(model: @user, message: captcha_message) || !@user.save(context: :create)
        format.html { render :signup }
      else
        UserMailer.activate_user(@user).deliver_later
        format.html { redirect_to :user_created }
      end
    end
  end

  def user_created
  end

  private
  def user_params
    params.require(:user)
      .permit(:name, :password, :password_confirmation, :email)
  end
end
