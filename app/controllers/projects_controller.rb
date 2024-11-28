class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = Project.all
    if params[:query].present?
      sql_subquery = <<~SQL
        projects.title @@ :query
        OR projects.region @@ :query
        OR categories.name @@ :query
      SQL
      @projects = @projects.joins(:categories).where(sql_subquery, query: params[:query])
    end
    @markers = @projects.geocoded.map do |project|
    {
      lat: project.latitude,
      lng: project.longitude,

      info_window_html: render_to_string(partial: "info_window", locals: {project: project}),
    }
    end

    if params[:query].present?
      @projects = @projects.where("title ILIKE ?", "%#{params[:query]}%")
    end
    @projects.sort_by { |i| i.created_at }
  end

  def new
    @projects = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :address, :auditor, :progress, :target)
  end

end
