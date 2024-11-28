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
    amount = (donation_params[:amount].to_f * 100)
    @donation = Donation.new(amount: amount.to_i)

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
