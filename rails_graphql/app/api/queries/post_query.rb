module PostQuery
  Show = GraphQL::Field.define do
    type !PostType
    argument :id, !types.ID
    description 'Find a Post by ID'
    resolve ->(obj, args, ctx) { Post.find(args['id']) }
  end

  Index = GraphQL::Field.define do
    type types[!PostType]
    description 'Get all Post'
    resolve ->(obj, args, ctx) { Post.all }
  end

  Update = GraphQL::Relay::Mutation.define do
    name 'UpdatePost'

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
