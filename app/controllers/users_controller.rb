class UsersController < ApplicationController
  def profile
    @donations = current_user.donations
    @projects = current_user.projects.order(created_at: :desc)
    @other_projects = Project.where.not(user: current_user)
  end
end
