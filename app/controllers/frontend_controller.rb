class FrontendController < ApplicationController
  def index
    @jobs = Job.find_all_active
  end

  def search
    @jobs = Job.search_all params[:q]
  end

  def job
    begin
      @job = Job.find_active params[:id]
    rescue ActiveRecord::RecordNotFound
      render_404 and return
    end

    if params[:title] != @job.title.parameterize
      redirect_to job_url(@job.id, @job.title.parameterize), :status => 303
    end
  end

  def company
    begin
      @company = Company.find_active params[:id]
    rescue ActiveRecord::RecordNotFound
      render_404 and return
    end

    if params[:name] != @company.name.parameterize
      redirect_to company_url(@company.id, @company.name.parameterize), :status => 303
    end
  end

  private
  def render_404
    render file: "#{Rails.root}/public/404.html" , status: :not_found
  end
end
