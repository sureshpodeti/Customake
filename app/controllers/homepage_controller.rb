class HomepageController < ApplicationController
  
  def index
    @winners=CompetitionWinner.all
    @messages=ScrollMessage.all
  end

  def new
  	@winner=CompetitionWinner.new
  end
  
  def create
  	@winner=CompetitionWinner.new(winner_params)
  	if @winner.save
  		redirect_to root_path
  	else
  		redirect_to root_path
  	end
  end


  private

  def winner_params
  	params.require(:competition_winner).permit(:artifact, :winner_name, :college, :position)
  end					

end
