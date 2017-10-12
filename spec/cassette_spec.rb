require 'rails_helper'

describe "creating a response using VCR" do
	VCR.use_cassette("home") do
	  response = Net::HTTP.get_response(URI('https://api.github.com/?access_token=764dafe80fa5ef291016803436b56341d5946239'))
		it "has the information I need" do
			response.body.to_json
		end
	end
end