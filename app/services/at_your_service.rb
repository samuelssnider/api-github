class AtYourService
	attr_reader :user :conn
	
	def initialize(user)
		@user = user
		@conn = Faraday.new(url: "https://github.com") do |faraday|
			faraday.token_auth("#{user.oauth_token}")
      faraday.headers["X-API-Key"] = ENV["github_key"]
			faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
		end
	end
	
	
	
	def self.find_followers(uid)
		user = User.where(uid: uid)
		new(user)
	end
	
	
end