class Job < ActiveRecord::Base
  belongs_to :company

  searchable do
    text :title, :brief_description, :description
    text :company do
      company.name if company
    end
  end

  def self.find_all_active
    select('jobs.title, jobs.brief_description, jobs.company_id')
      .joins(:company)
      .where('companies.active = ? AND jobs.active = ?', true, true)
  end

  def self.search_all(criteria)
    query = search do
      fulltext criteria
    end
    query.results
  end
end
