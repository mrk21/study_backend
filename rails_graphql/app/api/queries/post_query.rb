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

  Update = GraphQL::Relay::Mutation.define do
    name 'UpdatePost'
    description 'Update a Post by ID'

    input_field :id, !types.ID
    input_field :title, !types.String

    return_field :post, PostType

    resolve ->(obj, inputs, ctx) {
      post = Post.find(inputs['id'])
      post.update!(title: inputs['title'])
      { post: post }
    }
  end
end
