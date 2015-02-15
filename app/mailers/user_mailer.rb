class UserMailer < ActionMailer::Base
  default from: 'mail@mail.com'

  def activate_user(user)
    @user = user
    mail to: @user.email, subject: 'Activate your user account - JobBoard'
  end
end
