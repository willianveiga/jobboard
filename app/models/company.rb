class Company < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  def self.find_active(id)
    where(active: true)
      .find(id)
  end
end
