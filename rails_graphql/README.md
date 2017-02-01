# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## How to start

1. Enter `rbenv install` command
1. Enter `bundle install` command
1. Enter `bundle exec rake db:setup` command
1. Enter `bundle exec rails s` command
1. Open http://localhost:3000
1. Post the following query:
    ```
    {
      post(id: 1) {
        id
        title
      }
      posts {
        id
        title
      }
    }
    ```

## Memo

### Mutation

```
mutation updatePost($input: UpdatePostInput!) {
  result: updatePost(input: $input) {
    post {
      id
      title
    }
  }
}
```

```
{
  "input": {
    "id": 1,
    "title": "fuga"
  }
}
```

### Error Handling

```ruby
MySchema.rescue_from(ActiveRecord::RecordNotFound) { "An item could not be found" }
```

or

```ruby
MySchema = GraphQL::Schema.define do
  rescue_from(ActiveRecord::RecordNotFound) { "An item could not be found" }
end
```

* [Method: GraphQL::Schema::RescueMiddleware#rescue_from — Documentation for rmosolgo/graphql-ruby (master)](http://www.rubydoc.info/github/rmosolgo/graphql-ruby/GraphQL%2FSchema%2FRescueMiddleware%3Arescue_from)

## Refer to

* [rmosolgo/graphql-ruby-demo: Use graphql-ruby to expose a Rails app](https://github.com/rmosolgo/graphql-ruby-demo)
* [Introduction to GraphQL | GraphQL](http://graphql.org/learn/)
* [GraphQL Ruby - Welcome](https://rmosolgo.github.io/graphql-ruby/)
* [西日暮里.rbでGraphQL on RubyというLTをした - Please Drive Faster](http://joe-re.hatenablog.com/entry/2016/05/04/174742)
* [Method: GraphQL::Schema::RescueMiddleware#rescue_from — Documentation for rmosolgo/graphql-ruby (master)](http://www.rubydoc.info/github/rmosolgo/graphql-ruby/GraphQL%2FSchema%2FRescueMiddleware%3Arescue_from)
