class PaymentsController < ApplicationController

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end
end
