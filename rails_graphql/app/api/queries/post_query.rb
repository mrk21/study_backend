module PostQuery
  Show = GraphQL::Field.define do
    description 'Find a Post by ID'

    type !PostType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) { Post.find(args['id']) }
  end

  module Index
    Type = PostType.connection_type

    def self.call(obj, args, ctx)
      Post.all
    end
  end
end
