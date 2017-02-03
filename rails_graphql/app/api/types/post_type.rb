PostType = GraphQL::ObjectType.define do
  name 'Post'
  description 'A post'
  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :createdAt, !types.String, resolve: AttrResolver.new(:created_at)
  field :updatedAt, !types.String, resolve: AttrResolver.new(:updated_at)
end
