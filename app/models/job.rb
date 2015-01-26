class Job < ActiveRecord::Base
  belongs_to :company

  searchable do
    text :title, :description
    text :company do
      company.name if company
    end
  end

  def self.search_by_criteria(criteria)
    query = search do
      fulltext criteria
    end
    query.results
  end

end
