class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, nickname: auth.info.nickname)
    user.provider     = auth.provider
    user.nickname     = auth.info.nickname
    user.uid          = auth.uid
    user.email        = auth.info.email
    user.name         = auth.info.name
    user.avatar_url   = auth.info.image
    user.access_token = auth.credentials.token
    user.save
    user
  end
end
