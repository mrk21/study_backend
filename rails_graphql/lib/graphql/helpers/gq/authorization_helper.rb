module GQ::AuthorizationHelper
  module Methods
    def authorize(ctx, record, query)
      _policy = policy(ctx, record)
      unless _policy.public_send(query)
        raise Pundit::NotAuthorizedError, query: query, record: record, policy: _policy
      end
      record
    end

    def policy(ctx, record)
      Pundit.policy(ctx[:current_user], record)
    end

    def policy_scope(ctx, scope)
      user = ctx[:current_user]
      policy_scope = Pundit::PolicyFinder.new(scope).scope
      policy_scope.new(user, scope).resolve if policy_scope
    end
  end

  extend Methods
  Helper = self

  module Authorize
    def self.call(target, *args)
      Helper.public_send :authorize, *args
    end
  end

  module Policy
    def self.call(target, *args)
      Helper.public_send :policy, *args
    end
  end

  module PolicyScope
    def self.call(target, *args)
      Helper.public_send.send :policy_scope, *args
    end
  end

  [GraphQL::Field, GraphQL::Relay::Mutation].each do |type|
    type.accepts_definitions(
      authorize: self::Authorize,
      policy: self::Policy,
      policy_scope: self::PolicyScope,
    )
  end
end
