class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = Project.order(created_at: :desc)
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
      marker_html: render_to_string(partial: "marker"),
      info_window_html: render_to_string(partial: "info_window", locals: {project: project}),
    }
    end
  end

  def new
    @project = Project.new
    @project.categories.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.progress = 0
    p @project.target
    if @project.target&.positive?
      @project.target *= 100
    end
    if @project.save
      p @project.target
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @project = Project.find(params[:id])
    @projects = Project.all
    if @project.geocoded?
      @markers = [
        lat: @project.latitude,
        lng: @project.longitude,
        marker_html: render_to_string(partial: "marker"),
        info_window_html: render_to_string(partial: "info_window", locals: {project: @project})
      ]
    else
      @markers = []
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to profile_path(current_user), status: :see_other
  end
  private

  def project_params
    params.require(:project).permit(:title, :description, :address, :auditor, :progress, :target, :region, :closing_date, :photo, categories_attributes: [:id, :name])
  end

end
