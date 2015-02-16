class User < ActiveRecord::Base
  has_secure_password

  before_create do
    self.active = false
    self.activation_code = RandomToken.gen 9
  end

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :email, uniqueness: true
  validates_email_format_of :email, check_mx: true

  def self.activate(activation_code)
    user = where(active: false)
      .find_by_activation_code!(activation_code)
    user.active = true
    user.save!
    user
  end
end
