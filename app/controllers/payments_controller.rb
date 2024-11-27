class PaymentsController < ApplicationController

  def show
    # @payment = Payment.find(params[:id])
  end

  def new
    # @payment = Payment.new
    @donation_order = current_user.donations.where(state: 'pending').find(params[:donation_id])
  end
end
