class JobsController < ApplicationController
  before_action :set_company
  before_action :set_job, only: [:edit, :update, :show, :destroy]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
