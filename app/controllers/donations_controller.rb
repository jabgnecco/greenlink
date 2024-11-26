class DonationsController < ApplicationController
  def index
    @donations = Donations.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @donation = Donation.new
  end

  def create
    @project = Project.find(params[:project_id])
    @donation = Donation.new(donation_params)
    @donation.project = @project
    @donation.user = current_user
    @donation.save
  end
  private

  def donation_params
    params.require(:donation).permit(:amount, :state, :donation_sku, :checkout_session_id)
  end
end
