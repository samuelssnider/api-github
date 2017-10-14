class AtYourService
	attr_reader :user, :conn
	
	def initialize(user)
		@user = user
		@conn = Faraday.new(url: "https://api.github.com") do |faraday|
			# faraday.token_auth("#{user.oauth_token}")
      faraday.headers["X-API-Key"] = ENV["github_key"]
			faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
		end
	end
	
	def parse_url(url)
		response = conn.get(url)
		JSON.parse(response.body)
	end
	
	def api_home
		parse_url(nil)
	end
	
	def starred
		parse_url("users/#{user.user_name}/starred").map{|repo| [repo["name"], repo["owner"]["url"]]}
	end
	
	def repos
		parse_url("users/#{user.user_name}/repos").map{|repo| [repo["name"], repo["html_url"]]}
	end
	
	def followers
		parse_url("users/#{user.user_name}/followers").map{|user| [user["login"], user["html_url"]]}
	end
	
	def following
		parse_url("users/#{user.user_name}/following").map{|user| [user["login"], user["html_url"]]}
	end
	
	def my_events
		parse_url
	
	def self.set_user(uid)
		@user = User.find_by(uid: uid)
	end
	
	def timeline
		parse_url("timeline/?access_token=#{user.oauth_token}")
	end
	
end