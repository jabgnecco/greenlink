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
    @donation.state = "pending"
    @donation.save

    session = Stripe::Checkout::Session.create(
      project_method_types: ['card'],
      line_items: [{
        name: @donation.donation_sku,
        amount: @donation.amount,
        currency: 'gbp',
        quantity: 1
        }],
        succes_url: donation_url(@donation),
        cancel_url: donation_url(@donation)
      )

      @donation.update(checkout_session_id: session.id)
      redirect_to new_payment_path(donation_id: @donation.id)
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :donation_sku)
  end
end
