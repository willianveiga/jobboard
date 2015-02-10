class Company < ActiveRecord::Base
  has_many :jobs

  def self.find_active(id)
    where(active: true)
      .find(id)
  end
end
