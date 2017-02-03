ApiSchema = GraphQL::Schema.define do
  query GraphQL::ObjectType.define {
    name 'ApiQuery'
    description 'The query root of this schema'

    field :post, PostQuery::Show
    connection :posts, PostQuery::Index::Type, resolve: PostQuery::Index
  }

  mutation GraphQL::ObjectType.define {
    name 'ApiMutation'
    description 'The mutation root of this schema'

    # post
    field :updatePost, field: PostMutation::Update.field

    # session
    field :createSession, field: SessionMutation::Create.field
    field :deleteSession, field: SessionMutation::Delete.field
  }
end

ApiSchema.middleware << CustomRescueMiddleware.new {
  rescue_from(ActiveRecord::RecordNotFound) { |e| e.message }
  rescue_from(ActiveRecord::RecordInvalid) { |e| e.message }
  rescue_from(SessionMutation::AuthenticationError) { |e| e.message }
  rescue_from(SessionMutation::AuthorizationError) { |e| e.message }
  rescue_from(StandardError) { '500 error!' }
}
