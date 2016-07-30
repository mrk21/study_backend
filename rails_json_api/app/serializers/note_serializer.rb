class NoteSerializer < ActiveModel::Serializer
  belongs_to :user
  
  attributes :id
  attributes :title
  attributes :content
  attributes :created_at
  attributes :updated_at
end
