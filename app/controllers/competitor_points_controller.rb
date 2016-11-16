class CompetitorPointsController < ApplicationController
	before_action :authenticate_competitor!

	def index 
		@submissions=CompetitionSubmission.all
		@competitor=current_competitor
		@records=@submissions.where(:competitor_id => @competitor)
	end	
end
