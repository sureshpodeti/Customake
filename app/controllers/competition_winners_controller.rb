class CompetitionWinnersController < ApplicationController

	def index
		@winners=CompetitionWinner.all
	end
	
end
