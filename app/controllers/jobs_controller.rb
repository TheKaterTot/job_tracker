class JobsController < ApplicationController
  before_action :set_company
  before_action :set_job, only: [:edit, :update, :show, :destroy]

  def index
    if params[:location]
      @jobs = jobs.where(city: params[:location])
    else
      @jobs = jobs
    end

    # @jobs.order(sort_param)

    if params[:sort]== "location"
      @jobs = @jobs.order("city")
    end

    if params[:sort]== "interest"
      @jobs = @jobs.order("level_of_interest")
    end
  end

  def sort_param
    {
      "location" => :city,
      "interest" => :level_of_interest
    }.fetch(params[:sort], :created_at)
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
    @comment = Comment.new()
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
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_company
    if params[:company_id]
      @company = Company.find(params[:company_id])
    end
  end

  def set_job
    @job = jobs.find(params[:id])
  end

  def jobs
    if params[:company_id]
      @company.jobs
    else
      Job.all
    end
  end
end
