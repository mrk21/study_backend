require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:current_user) { FactoryGirl.create :user }

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
    let!(:record) { FactoryGirl.create :post, user: current_user }

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

    it 'returns a post specified by `id`' do
      is_expected.to be_json_as({
        data: {
          post: {
            id: record.id.to_s,
            title: record.title,
            body: record.body,
            createdAt: record.created_at.to_s,
            updatedAt: record.updated_at.to_s,
          }
        }
      })
    end
  end

  describe "query posts" do
    let!(:record1) { FactoryGirl.create :post, user: current_user }
    let!(:record2) { FactoryGirl.create :post, user: current_user }

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
            edges: [
              {
                node: {
                  id: record1.id.to_s,
                  title: record1.title,
                  body: record1.body,
                  createdAt: record1.created_at.to_s,
                  updatedAt: record1.updated_at.to_s,
                }
              },
              {
                node: {
                  id: record2.id.to_s,
                  title: record2.title,
                  body: record2.body,
                  createdAt: record2.created_at.to_s,
                  updatedAt: record2.updated_at.to_s,
                }
              }
            ]
          }
        }
      })
    end
  end
end
