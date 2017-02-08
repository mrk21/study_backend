class GQ::AuthorizationHelper
  def call(target, argument_name, *args, &block)
    pp '@'*100, target, argument_name, args
  end

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

  class << self
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
end
