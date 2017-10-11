class User < ApplicationRecord
	def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by( uid: auth['uid'])

    user.uid = auth['uid']
    user.user_name = auth['info']['nickname']
    user.oauth_token = auth['credentials']['token']
		user.created_at = Time.zone.now
		user.updated_at = Time.zone.now
    user.save
    user
  end
end
