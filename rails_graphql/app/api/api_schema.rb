ApiSchema = GraphQL::Schema.define do
  query_type = GraphQL::ObjectType.define do
    name 'Query'
    description 'The query root of this schema'

    field :post, PostQuery::Show
    field :posts, PostQuery::Index
  end

  mutation_type = GraphQL::ObjectType.define do
    name 'Mutation'
    description 'The mutation root of this schema'

    field :updatePost, field: PostQuery::Update.field
  end

  query query_type
  mutation mutation_type
end
