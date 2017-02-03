module PostMutation
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
