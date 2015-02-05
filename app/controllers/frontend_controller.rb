class FrontendController < ApplicationController
  def index
    @jobs = Job.find_all_active
  end
end
