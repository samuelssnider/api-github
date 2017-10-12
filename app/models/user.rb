class User < ApplicationRecord
	validates :provider, :image, :created_at, :updated_at, :user_name, presence: true
	validates :uid, :email, :oauth_token, :login, :url, presence: true, uniqueness: true
	
	def self.find_or_create_by_omniauth(auth)
    user = User.find_or_create_by( uid: auth['uid'])
		user.provider    = auth["provider"]
    user.uid         = auth['uid']
    user.user_name   = auth['info']['nickname']
		user.email       = auth['info']['email']
		user.image       = auth['info']['image']
		
    user.oauth_token = auth['credentials']['token']
		
		
		user.login       = auth['extra']['raw_info']['login']
		user.url         = auth['extra']['raw_info']['url']
		user.name         = auth['extra']['raw_info']['name']
		user.created_at  = auth['extra']['raw_info']['created_at']
		user.updated_at  = auth['extra']['raw_info']['updated_at']
    user.save
    user
  end
	
	def followers(uid)
		AtYourService.find_followers(uid)
	end
end
