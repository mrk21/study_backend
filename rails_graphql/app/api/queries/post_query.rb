module PostQuery
  Show = GraphQL::Field.define do
    description 'Find a Post by ID'

    type !PostType
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      post = Post.find(args['id'])
      authorize ctx, post, :show?
    }
  end

  module Index
    extend GQ::AuthorizationHelper::Methods

    Type = PostType.connection_type

    def self.call(obj, args, ctx)
      policy_scope ctx, Post
    end
  end
end
