require 'gq/authorization_helper'

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

ApiSchema.middleware << GraphQL::Schema::TimeoutMiddleware.new(max_seconds: 5)
ApiSchema.middleware << GQ::CustomRescueMiddleware.new {
  rescue_from(ActiveRecord::RecordNotFound) { |e| e.message }
  rescue_from(ActiveRecord::RecordInvalid) { |e| e.message }
  rescue_from(SessionMutation::AuthenticationError) { |e| e.message }
  rescue_from(Pundit::NotAuthorizedError) { |e| Rails.logger.error e.message; 'Does not permit!' }

  rescue_from(StandardError) { |e|
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
    '500 error!'
  }
}
