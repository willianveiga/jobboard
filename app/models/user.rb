class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  belongs_to :company
end
