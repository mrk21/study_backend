class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  validates :title, presence: true
end
