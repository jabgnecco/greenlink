class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
    # @stripe_url = params[:stripe_url]
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

    stripe_session = Stripe::Checkout::Session.create(
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
      success_url: donation_success_url(@donation),
      cancel_url: project_url(@donation.project)
    )
    @donation.update(checkout_session_id: session.id)
    @stripe_url = stripe_session[:url]
    # TODO: Redirect to the new stripe_url - the external route here wasn't working.
    # redirect_to session[:url], allow_other_host: true, status: 303
    # render :new
    redirect_to donation_success_path(@donation)
  end


  def success
    @donation_paid = Donation.find(params[:id])
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :donation_sku)
  end
end
