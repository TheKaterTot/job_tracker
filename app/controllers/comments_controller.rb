class CommentsController < ApplicationController
  before_action :set_company
  before_action :set_job

  def create
    @comment = @job.comments.new(comment_params)
    if @comment.save
      redirect_to company_job_path(@company, @job)
    else
      render "jobs/show"
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = @company.jobs.find(params[:job_id])
  end

end
