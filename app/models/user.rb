class User < ActiveRecord::Base
  has_secure_password

  before_create do
    self.active = false
    true
  end

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: true
  validates_email_format_of :email, check_mx: true
end
