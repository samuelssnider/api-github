require 'rails'

describe 'as a guest i can login as a user using github' do
	it 'and see the authorized index page' do
		include Helper
		create_a_user
		binding.pry
		
	end
end
		