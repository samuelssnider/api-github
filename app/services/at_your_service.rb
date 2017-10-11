class AtYourService
	
	def initialize(user)
		@conn = Faraday.new(url: "https://github.com") do |faraday|
			faraday.token_auth("#{user.oauth_token}")
      faraday.headers["X-API-Key"] = ENV["github_key"]
			faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
		end
	end
end