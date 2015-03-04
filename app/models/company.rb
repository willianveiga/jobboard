class Company < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :brief_description, presence: true
  validates :description, presence: true
  validates :website, :url => {:allow_null => true, :allow_blank => true}

  belongs_to :user
  has_many :jobs

  def self.find_active(id)
    where(active: true)
      .find(id)
  end
end
