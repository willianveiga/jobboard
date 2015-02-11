class Job < ActiveRecord::Base
  belongs_to :company

  searchable do
    text :title, :brief_description, :description
    boolean :active
    text :company do
      company.name
    end
  end

  def self.search_all(criteria)
    query = search do
      fulltext criteria
      with :active, true
    end
    self.results_where_company_is_active query.results
  end

  def self.find_all_active
    select('jobs.id, jobs.title, jobs.brief_description, jobs.company_id')
      .joins(:company)
      .where('companies.active = ? AND jobs.active = ?', true, true)
  end

  def self.find_active(id)
    where('jobs.active = ? AND companies.active = ?', true, true)
      .joins(:company)
      .find(id)
  end

  def self.find_active_by_company_id(id)
    where('companies.id = ? AND jobs.active = ? AND companies.active = ?', id, true, true)
      .joins(:company)
  end

  private
  def self.results_where_company_is_active(results)
    filtered_results = []
    results.each do |job|
      if job.company.active
        filtered_results << job
      end
    end
    filtered_results
  end
end
