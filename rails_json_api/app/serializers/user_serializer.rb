class UserSerializer < ActiveModel::Serializer
  has_many :notes do
    meta do
      { aa: 1 }
    end
  end
  
  attributes :id
  attributes :username
  attributes :email

  meta do
    { aa: 1 }
  end
end
