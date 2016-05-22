class UserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :username
  attributes :email
end
