module PostQuery
  Show = GraphQL::Field.define do
    description 'Find a Post by ID'

    type !PostType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) { Post.find(args['id']) }
  end

  Index = GraphQL::Field.define do
    description 'Get all Post'

    type types[!PostType]
    resolve ->(obj, args, ctx) { Post.all }
  end
end
