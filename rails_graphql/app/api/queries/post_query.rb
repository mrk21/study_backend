module PostQuery
  Show = GraphQL::Field.define do
    description 'Find a Post by ID'

    type !PostType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      post = Post.find(args['id'])
      AuthorizationHelper.authorize(ctx, post, :show?)
      post
    }
  end

  module Index
    Type = PostType.connection_type

    def self.call(obj, args, ctx)
      AuthorizationHelper.policy_scope(ctx, Post)
    end
  end
end
