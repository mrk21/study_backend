ApiSchema = GraphQL::Schema.define do
  query GraphQL::ObjectType.define {
    name 'Query'
    description 'The query root of this schema'

    field :post, PostQuery::Show
    field :posts, PostQuery::Index
  }

  mutation GraphQL::ObjectType.define {
    name 'Mutation'
    description 'The mutation root of this schema'

    field :updatePost, field: PostQuery::Update.field
  }

  rescue_from(ActiveRecord::RecordNotFound) { |e| e.message }
  rescue_from(ActiveRecord::RecordInvalid) { |e| e.message }
end
