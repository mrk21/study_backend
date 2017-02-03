class AttrResolver
  attr_reader :attr

  def initialize(attr)
    @attr = attr
  end

  def call(obj, args, ctx)
    obj.public_send(attr)
  end
end
