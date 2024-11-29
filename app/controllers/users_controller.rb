class UsersController < ApplicationController
  def my_donations
    @donations = current_user.donations.where(state: "Paid")
  end
end
