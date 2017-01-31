module Schemas
  RootSchema = GraphQL::Schema.define do
    query_type = GraphQL::ObjectType.define do
      name 'Query'
      description 'The query root of this schema'

      field :post, Schemas::PostSchema::Show
      field :posts, Schemas::PostSchema::Index
    end

    query query_type
  end
end
