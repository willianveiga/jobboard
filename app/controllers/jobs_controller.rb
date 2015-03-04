class JobsController < ApplicationController
  include Loggable

  def index
    user = User.find session[:user_id]
    @jobs = user.company.jobs
  end
end
