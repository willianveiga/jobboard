class Job < ActiveRecord::Base
  belongs_to :company

  def self.find_all_active
    where(active: true)
  end
end
