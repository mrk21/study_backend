module SessionMutation
  class AuthorizationError < StandardError; end
  class AuthenticationError < StandardError; end

  Create = GraphQL::Relay::Mutation.define do
    name 'CreateSession'
    description 'Create a session'

    input_field :email, !types.String
    input_field :password, !types.String

    return_field :user, UserType

    resolve ->(obj, inputs, ctx) {
      user = User.find_by(email: inputs['email'], password: inputs['password'])
      raise AuthenticationError, 'Invalid authentication' if user.nil?
      ctx[:session][:current_user_id] = user.id
      { user: user }
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name 'DeleteSession'
    description 'Delete the session'

    resolve ->(obj, inputs, ctx) {
      ctx[:session][:current_user_id] = nil
      nil
    }
  end
end
