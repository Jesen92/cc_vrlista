class ProjectsController < ApplicationController
  def index
    @page_title = "Posao"
    @projects = Project.all

    @projects_grid = initialize_grid(@projects, :include => :company ,order: 'projects.created_at', order_direction: 'desc', per_page: 15)

  end

  def show
    @project = Project.find(params[:id])
    @page_title = "Posao | " + @project.title

    @project_grid = initialize_grid(@project.jobs, :include => :user , order: 'jobs.created_at', order_direction: 'desc', per_page: 15,
                                    name: 'project',enable_export_to_csv: true, csv_file_name: "Vremenska lista")

    export_grid_if_requested
  end

  def new
    @project = Project.new
    @page_title = "Posao | New"
  end

  def create
    @project = Project.new(project_params)

    @project.save

    flash[:notice] = "Dodan je novi posao!"

    redirect_to projects_index_path
  end

  def edit
    @project = Project.find(params[:id])
    @page_title = "Edit | "+@project.title
  end

  def update
    @project = Project.find(params[:id])

    @project.update(project_params)

    flash[:notice] = "Posao je izmijenjen!"

    redirect_to projects_index_path
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    flash[:notice] = "Posao je izbrisan!"

    redirect_to projects_index_path
  end

  protected
  def project_params
    params.require(:project).permit(:title, :description, :company_id)
  end
end
