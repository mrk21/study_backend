ApiSchema = GraphQL::Schema.define do
  query GraphQL::ObjectType.define {
    name 'ApiQuery'
    description 'The query root of this schema'

    field :post, PostQuery::Show
    field :posts, PostQuery::Index
  }

  mutation GraphQL::ObjectType.define {
    name 'ApiMutation'
    description 'The mutation root of this schema'

    field :updatePost, field: PostQuery::Update.field
  }
end

ApiSchema.middleware << CustomRescueMiddleware.new {
  rescue_from(ActiveRecord::RecordNotFound) { |e| e.message }
  rescue_from(ActiveRecord::RecordInvalid) { |e| e.message }
  rescue_from(StandardError) { '500 error!' }
}
