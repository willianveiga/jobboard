require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  belongs_to :company
  before_create :generate_salt, :hash_password

  def self.authenticate(username, password)
    user = self.find_by_username username
    return unless user
    salted_password = BCrypt::Engine.hash_secret(password, user.salt)
    return user if salted_password == user.password
  end

  private
  def generate_salt
    self.salt = BCrypt::Engine.generate_salt
  end

  def hash_password
    salted_password = BCrypt::Engine.hash_secret(self.password, self.salt)
    self.password = salted_password
  end
end
