class DonationsController < ApplicationController
  def index
    @donations = Donations.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
  end

  def create
    @project = Project.find(params[:project_id])
    @donation = Donation.new(donation_params)
    @donation.project = @project
    @donation.donation_sku = "#{@project.title.split.join('_')}_donation"
    @donation.user = current_user
    @donation.state = "pending"
    @donation.save

    session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          unit_amount: @donation.amount,
          currency: 'gbp',
          product_data: {
            name: @donation.donation_sku,
          },
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: project_url(@donation.project),
      cancel_url: project_url(@donation.project)
    )




      @donation.update(checkout_session_id: session.id)
      redirect_to new_payment_path(donation_id: @donation.id)
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :donation_sku)
  end
end
