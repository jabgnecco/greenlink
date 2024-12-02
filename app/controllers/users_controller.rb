class UsersController < ApplicationController
  def profile
    @donations = current_user.donations.where(state: "paid")
  end
end
