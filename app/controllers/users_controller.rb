class UsersController < ApplicationController
  def profile
    @donations = current_user.donations
    @projects = current_user.projects.order(created_at: :desc)
  end


end
