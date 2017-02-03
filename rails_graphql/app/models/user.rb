class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  validates :email, presence: true
  validates :password, presence: true
end
