class JobsController < ApplicationController
  require 'csv'

  def index
    @page_title = "Vremenska lista"
    @jobs = Job.all

    @jobs_grid = initialize_grid(@jobs, name: 'jobs', :include => [:user, {project: :company}], order: 'jobs.created_at', order_direction: 'desc',
                                 enable_export_to_csv: true, csv_file_name: "Vremenska")

    export_grid_if_requested
  end

  def show
    @job = Job.find(params[:id])
    @page_title = "Vremenska lista | " + @job.project.title
  end

  def new
    @job = Job.new
    @page_title = "Vremenska lista | New"
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.save

    flash[:notice] = "Dodan je novi unos u Vremensku listu!"

    redirect_to jobs_index_path
  end

  def edit
    @job = Job.find(params[:id])
    @page_title = "Edit | "+@job.project.title
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)

    flash[:notice] = "Vremenska lista je izmijenjen!"

    redirect_to jobs_index_path
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    flash[:notice] = "Unos u Vremenskj listi je izbrisan!"

    redirect_to jobs_index_path
  end

  protected
  def job_params
    params.require(:job).permit(:project_id,:hours, :description, :user_id, :job_date)
  end
end
