class CompetitionTasksController < ApplicationController
	before_action :authenticate_competitor!

	def index
		@tasks=CompetitionTask.all
	end
	
	def new
		@task=CompetitionTask.new
	end
	
	def create
		@task=CompetitionTask.new(competition_params)
		if @task.save
			redirect_to competitor_profiles_path
		else
			redirect_to competition_tasks_path
		end	
	end
	
	private
	def competition_params
		params.require(:competition_task).permit(:artifact, :description, :deadline, :current_task)	
	end					
end
