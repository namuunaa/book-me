require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :books, foreign_key: :owner_id  
  has_many :rentals, foreign_key: :renter_id
  has_many :books, through: :rentals

  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(login_email, login_password)
    self.email == login_email && self.password == login_password
  end
end
