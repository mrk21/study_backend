require 'bundler'
Bundler.require
require 'pp'

class Comment < Struct.new(:id, :body, :created_at)
end

class Post < Struct.new(:id, :title, :body, :comments)
  class << self
    def all
      [
        self.new('1', 'title 1', 'body 1', [Comment.new('1', 'comment 1', Time.now)]),
        self.new('2', 'title 2', 'body 2', [Comment.new('2', 'comment 2', Time.now)]),
        self.new('3', 'title 3', 'body 3', [Comment.new('3', 'comment 3', Time.now)]),
      ]
    end

    def find(id)
      all.find { |record| record.id == id }
    end
  end
end

PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"
  # `!` marks a field as "non-null"
  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :comments, types[!CommentType]
end

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :body, !types.String
  field :created_at, !types.String
end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :post do
    type PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve ->(obj, args, ctx) { Post.find(args["id"]) }
  end

  field :posts do
    type types[!PostType]
    resolve ->(obj, args, ctx) { Post.all }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end


# {
#   "data"=> {
#     "post"=> {
#       "id"=>"1",
#       "title"=>"title 1",
#       "comments"=> [
#         {"body"=>"comment 1", "created_at"=>"%Y-%m-%d %H:%M:%S %z"}
#       ]
#     }
#   }
# }
print 'Query: '
puts query = <<-GRAPHQL
{
  post(id: 1) {
    id
    title
    comments { body created_at }
  }
}
GRAPHQL
print 'Result: '
pp Schema.execute(query)
puts '='*100

# {
#   "data"=> {
#     "posts"=> [
#       {
#         "id"=>"1",
#         "title"=>"title 1",
#         "comments"=> [
#           {"body"=>"comment 1", "created_at"=>"%Y-%m-%d %H:%M:%S %z"}
#         ]
#       },
#       {
#         "id"=>"2",
#         "title"=>"title 2",
#         "comments"=> [
#           {"body"=>"comment 2", "created_at"=>"%Y-%m-%d %H:%M:%S %z"}
#         ]
#       },
#       {
#         "id"=>"3",
#         "title"=>"title 3",
#         "comments"=> [
#           {"body"=>"comment 3", "created_at"=>"%Y-%m-%d %H:%M:%S %z"}
#         ]
#       },
#   }
# }
print 'Query: '
puts query = <<-GRAPHQL
{
  posts {
    id
    title
    comments { body created_at }
  }
}
GRAPHQL
print 'Result: '
pp Schema.execute(query)
