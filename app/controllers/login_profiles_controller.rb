class LoginProfilesController < ApplicationController
	def new
		@profile = LoginProfile.new
	end


	def create
		@profile_obj = LoginProfile.new(login_params)
		@profile = @profile_obj.profile
		if @profile == "Customer"
			redirect_to customer_profiles_path
		elsif @profile == "Manufacturer"
			redirect_to manufacturer_profiles_path
		elsif @profile == "Competitor"
			redirect_to competitor_profiles_path
		end
	end


	private
	def login_params
		params.require(:login_profile).permit(:profile)
	end
end
