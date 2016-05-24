class NoteSerializer < ActiveModel::Serializer
  has_one :user
  
  attributes :id
  attributes :title
  attributes :content
  attributes :created_at
  attributes :updated_at
end
