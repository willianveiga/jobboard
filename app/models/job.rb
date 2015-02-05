class Job < ActiveRecord::Base
  belongs_to :company

  searchable do
    text :title, :description
    text :company do
      company.name if company
    end
  end

  def self.find_all_active
    where(active: true)
  end

  def self.search_all(criteria)
    query = search do
      fulltext criteria
    end
    query.results
  end
end
