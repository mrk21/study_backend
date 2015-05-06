class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    self.create(
      provider: auth['provider'],
      uid: auth['uid'],
      screen_name: auth['info']['nickname'],
      name: auth['info']['name']
    )
  end
end
