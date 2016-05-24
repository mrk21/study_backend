class UserSerializer < ActiveModel::Serializer
  has_many :notes
  
  attributes :id
  attributes :username
  attributes :email
end
