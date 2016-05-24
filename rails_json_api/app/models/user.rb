class User < ActiveRecord::Base
  has_many :notes, inverse_of: :user
end
