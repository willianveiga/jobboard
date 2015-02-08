class FrontendController < ApplicationController
  def index
    @jobs = Job.find_all_active
  end

  def search
    @jobs = Job.search_all params[:q]
  end

  def job
    @job = Job.find_active params[:id]

    rescue ActiveRecord::RecordNotFound
      render_404
  end

  private
  def render_404
    render file: "#{Rails.root}/public/404.html" , status: :not_found
  end
end
