json.array!(@users) do |user|
  json.extract! user, :id, :provider, :uid, :name, :nickname, :email, :avatar_url, :access_token
  json.url user_url(user, format: :json)
end
