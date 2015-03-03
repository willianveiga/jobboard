class CompaniesController < ApplicationController
  include Loggable

  def profile
    @user = User.find session[:user_id]
    @company = @user.company || Company.new
  end

  def save
    @user = User.find session[:user_id]
    if @user.company
      @company = @user.company
    else
      @company = @user.company || Company.new(company_params)
      @company.user = @user
    end

    respond_to do |format|
      if request.post? and @company.save or request.patch? and @company.update company_params
        format.html { redirect_to backend_path, notice: 'Company was successfully saved.' }
      else
        format.html { render :profile }
      end
    end
  end

  private
  def company_params
    params.require(:company)
      .permit(:name, :brief_description, :description, :website)
  end
end
