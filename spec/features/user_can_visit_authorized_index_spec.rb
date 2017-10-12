require 'rails_helper'

describe 'as a guest i can login as a user using github' do
	it 'and see the authorized index page' do
		include Helpers
		Helpers.create_a_user
		allow_any_instance_of(AtYourService)
		.to receive(:api_home)
		.and_return(JSON.parse(Helpers.home_api_json.to_json))
		ats = AtYourService.new(User.first).api_home
		expect(ats["current_user_url"]).to eq("https://api.github.com/user")
		binding.pry
	end
end


		