module Helper
	def create_a_user
		User.create(provider: "github",
			 					uid: "24855364",
								user_name: "samuelssnider",
								email: "sam_redins@yahoo.com",
								image: "https://avatars2.githubusercontent.com/u/24855364?v=4",
								oauth_token: "f2fcbf28027820b75a4badce167ffd8a9a4708c4",
								login: "samuelssnider", 
								url: "https://api.github.com/users/samuelssnider", 
								created_at: "2016-12-31 16:34:51", 
								updated_at: "2017-10-11 15:01:22", 
								name: "Samuel S Snider"                                       
							 )
	end
end