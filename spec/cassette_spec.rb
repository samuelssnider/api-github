require 'rails_helper'

describe "creating a response using VCR" do
	VCR.use_cassette("home") do
	  response = Net::HTTP.get_response(URI('https://api.github.com/?access_token=764dafe80fa5ef291016803436b56341d5946239'))
		it "has the information I need" do
			response_hash = JSON.parse(response.body)
			expect(response_hash["current_user_url"]).to eq("https://api.github.com/user")
		end
	end
end