require 'securerandom'
require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  belongs_to :company
  before_save :generate_salt, :hash_password

  private
  def generate_salt
    self.salt = SecureRandom.base64
  end

  def hash_password
    salted_password = BCrypt::Password.create(self.salt << self.password)
    self.password = salted_password
  end
end
