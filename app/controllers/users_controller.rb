class UsersController < ApplicationController
  def profile
    @donations = current_user.donations.where(state: "paid")
    @projects = current_user.projects.order(created_at: :desc)
  end

  
end
