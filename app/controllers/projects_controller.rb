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
    @project = Project.new
    @project.categories.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.progress = 0
    if @project.save
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

        info_window_html: render_to_string(partial: "info_window", locals: {project: @project})
      ]
    else
      @markers = []
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to profile_path, status: :see_other
  end
  private

  def project_params
    params.require(:project).permit(:title, :description, :address, :auditor, :progress, :target, :region, :closing_date, categories_attributes: [:id, :name])
  end

end
