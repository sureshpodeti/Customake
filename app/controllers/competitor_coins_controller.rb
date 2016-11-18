class CompetitorCoinsController < ApplicationController
	before_action :authenticate_competitor!
	
	def index 
		@coins=CompetitorCoin.all
		@competitor=current_competitor
		@records=@coins.where(:competitor_id => @competitor)
	end		
end
