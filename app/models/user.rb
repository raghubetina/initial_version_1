class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider     = auth.provider
      user.uid          = auth.uid
      user.name         = auth.info.name
      user.nickname     = auth.info.nickname
      user.avatar_url   = auth.info.image
      user.access_token = auth.credentials.token
      user.save
    end
  end
end
