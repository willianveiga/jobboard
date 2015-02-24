module Loggable extend ActiveSupport::Concern
  included do
    before_filter :redirect_if_user_not_logged_in
  end

  private
  def redirect_if_user_not_logged_in
    redirect_to signin_path unless session[:user_id]
  end
end
