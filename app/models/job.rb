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
    query.results
  end

  def self.find_all_active
    select('jobs.title, jobs.brief_description, jobs.company_id')
      .joins(:company)
      .where('companies.active = ? AND jobs.active = ?', true, true)
  end
end
