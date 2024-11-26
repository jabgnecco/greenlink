class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @projects = Project.all

    @markers = @projects.geocoded.map do |flat|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end

  def show
    @projects = Project.find(params[:id])
  end

end
