require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:record) { FactoryGirl.create :post }
  let!(:current_user) { record.user }

  before do
    query =<<-GQ
      mutation CreateSession($input: CreateSessionInput!) {
        createSession(input: $input) {
          user {
            name
          }
        }
      }
    GQ
    variables = {
      input: {
        email: current_user.email,
        password: current_user.password
      }
    }
    post queries_path, params: {
      query: query,
      variables: variables
    }
  end

  describe "query post(id: ID!)" do
    let(:query) {
      <<-GRAPHQL
        query {
          post(id: "#{record.id}") {
            id
            title
            body
            createdAt
            updatedAt
          }
        }
      GRAPHQL
    }

    subject {
      post queries_path, params: { query: query }
      response.body
    }

    it 'returns a post by specified `id`' do
      is_expected.to be_json_as({
        data: {
          post: {
            id: String,
            title: String,
            body: String,
            createdAt: String,
            updatedAt: String,
          }
        }
      })
    end
  end

  describe "query posts" do
    let(:query) {
      <<-GRAPHQL
        query {
          posts {
            edges {
              node {
                id
                title
                body
                createdAt
                updatedAt
              }
            }
          }
        }
      GRAPHQL
    }

    subject {
      post queries_path, params: { query: query }
      response.body
    }

    it 'returns posts' do
      is_expected.to be_json_as({
        data: {
          posts: {
            edges: [{
              node: {
                id: String,
                title: String,
                body: String,
                createdAt: String,
                updatedAt: String,
              }
            }]
          }
        }
      })
    end
  end
end
