PostType = GraphQL::ObjectType.define do
  name 'Post'
  description 'A post'
  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :createdAt, !types.String do
    resolve ->(obj, args, ctx) { obj.created_at }
  end
  field :updatedAt, !types.String do
    resolve ->(obj, args, ctx) { obj.updated_at }
  end
end
