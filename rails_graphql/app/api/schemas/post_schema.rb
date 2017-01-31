module Schemas::PostSchema
  Show = GraphQL::Field.define do
    type !Types::PostType
    argument :id, !types.ID
    description 'Find a Post by ID'
    resolve ->(obj, args, ctx) { Post.find(args['id']) }
  end

  Index = GraphQL::Field.define do
    type types[!Types::PostType]
    description 'All Post'
    resolve ->(obj, args, ctx) { Post.all }
  end
end
