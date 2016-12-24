class HomepageController < ApplicationController

  def index
    # @winners=CompetitionWinner.all
    @messages=ScrollMessage.all
    @roles = ActorRole.all

  end

  def new
  	# @winner=CompetitionWinner.new
  end

  def create
  	# @winner=CompetitionWinner.new(winner_params)
    @role_id = params['role_id']
    if @role_id == 1
      redirect_to customer_profiles_path
    elsif @role_id == 2
      redirect_to manufacturer_profiles_path
    elsif  @role_id == 3
      redirect_to competitor_profiles_path
    end

  	# if @winner.save
  	# 	redirect_to root_path
  	# else
  	# 	redirect_to root_path
  	# end
  end


  # private

  # def winner_params
  # 	params.require(:competition_winner).permit(:artifact, :winner_name, :college, :position)
  # end

end
