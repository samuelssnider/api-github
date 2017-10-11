class SessionsController < ApplicationController
	def create
    @user = User.find_or_create_by_omniauth(request.env['omniauth.auth'])
  	if @user
			session[:user_id] = user.id
    	redirect_to authorized_index_path
		end
  end
	
	
	private
		attr_reader :user
		
	#eND iMAGINARY
end