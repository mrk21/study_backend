PostType = GraphQL::ObjectType.define do
  name 'Post'
  description 'A post'
  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
end
