class CompetitionSubmissionsController < ApplicationController
	before_action :authenticate_competitor!

	def index

		@task=CompetitionTask.find(params[:competition_task_id])
		@submissions=@task.competition_submissions.all
		@competitor=current_competitor
		@record=@submissions.where(:competition_task_id =>  @task, :competitor_id => @competitor)

		if @submissions.any? && @record.count !=0 && @record[0][:submitted_status] == true
			redirect_to 'new'
		else
			render 'new'		

		end		

	end
	

	def new
		@task=CompetitionTask.find(params[:competition_task_id])
		@submission=@task.competition_submissions.build
	end
	

	def create
		@task=CompetitionTask.find(params[:competition_task_id])
		@submission=@task.competition_submissions.new(submission_params)
		@submission.competitor_id=current_competitor.id
		# @submission[:submitted_status]=true
		if @submission.save && ! @submission.submitted_status == true
			values={ "competitor_id" => current_competitor.id, "competition_task_id" => @task.id, "points_earned" => 10 }
			@coin=CompetitorCoin.new(values)
			@coin.save
			@submission.update(:submitted_status => true)
			@submission.update(:points_earned => 1)
			redirect_to competitor_profiles_path
		else
			redirect_to new_competition_task_competition_submission_path(@task)
		end		
	end	


	private
	def submission_params
		params.require("competition_submission").permit(:competitor_id, :competition_task_id, :artifact, :points_earned, :submitted_status)
	end	
end
