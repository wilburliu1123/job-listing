class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
  def index
    @job = Job.all
  end
  def show
    @job = job.find(params[:id])

  end
  def edit
    @job = job.find(params[:id])

  end
  def new
    @job = job.new
  end
  def create
    @job = job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end
  def update
    @job = job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end
  def destroy
    @job = job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
