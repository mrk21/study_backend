module GQ::AuthorizationHelper
  module Methods
    def authorize(ctx, record, query)
      Pundit.authorize(ctx[:current_user], record, query)
    end

    def policy(ctx, record)
      Pundit.policy(ctx[:current_user], record)
    end

    def policy!(ctx, record)
      Pundit.policy!(ctx[:current_user], record)
    end

    def policy_scope(ctx, scope)
      Pundit.policy_scope(ctx[:current_user], scope)
    end

    def policy_scope!(ctx, scope)
      Pundit.policy_scope!(ctx[:current_user], scope)
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

  module PolicyBang
    def self.call(target, *args)
      Helper.public_send :policy!, *args
    end
  end

  module PolicyScope
    def self.call(target, *args)
      Helper.public_send :policy_scope, *args
    end
  end

  module PolicyScopeBang
    def self.call(target, *args)
      Helper.public_send :policy_scope!, *args
    end
  end

  [GraphQL::Field, GraphQL::Relay::Mutation].each do |type|
    type.accepts_definitions(
      authorize: self::Authorize,
      policy: self::Policy,
      policy!: self::PolicyBang,
      policy_scope: self::PolicyScope,
      policy_scope!: self::PolicyScopeBang,
    )
  end
end
