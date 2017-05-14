class Book < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :rentals
  has_many :renters, through: :rentals

  validates :author, :title, :genre, presence: true
end
