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

## Refer to

* [rmosolgo/graphql-ruby-demo: Use graphql-ruby to expose a Rails app](https://github.com/rmosolgo/graphql-ruby-demo)
* [Introduction to GraphQL | GraphQL](http://graphql.org/learn/)
* [GraphQL Ruby - Welcome](https://rmosolgo.github.io/graphql-ruby/)
* [西日暮里.rbでGraphQL on RubyというLTをした - Please Drive Faster](http://joe-re.hatenablog.com/entry/2016/05/04/174742)
