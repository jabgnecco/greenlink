class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = Project.all

    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,

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

    @markers = [{
      latitude: @project.latitude,
      longitude: @project.longitude,
      title: @project.title,
      description: @project.description
    }]
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :address, :auditor, :progress, :targer)
  end

end
