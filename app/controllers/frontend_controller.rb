class FrontendController < ApplicationController
  def index
    @jobs = Job.find_all_active
  end

  def search
    @jobs = Job.search_all params[:q]
  end
end
