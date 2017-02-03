module PostQuery
  Show = GraphQL::Field.define do
    description 'Find a Post by ID'

    type !PostType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      post = Post.find(args['id'])
      current_user_id = ctx[:session][:current_user_id]
      raise SessionMutation::AuthorizationError, 'Do not permit!' unless post.user.id == current_user_id
      post
    }
  end

  module Index
    Type = PostType.connection_type

    def self.call(obj, args, ctx)
      current_user_id = ctx[:session][:current_user_id]
      raise SessionMutation::AuthorizationError, 'Do not permit!' unless current_user_id
      Post.where(user_id: ctx[:session][:current_user_id])
    end
  end
end
