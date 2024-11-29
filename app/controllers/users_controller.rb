class UsersController < ApplicationController
  def my_donations
    @donations = current_user.donations.where(state: "paid")
  end
end
