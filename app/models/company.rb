class Company < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :brief_description, presence: true
  validates :description, presence: true
  has_many :jobs
  has_one :user
  accepts_nested_attributes_for :user
end
