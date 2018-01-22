class ChargesController < ApplicationController
  before_action :check_env

  def create
    @amount = 1000
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: stripe_token(params)
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Payment for food',
      currency: 'sek'
    )

    if charge.paid?
      message = 'Your transaction was successful!'
      redirect_to new_charge_path, notice: message
    end
  end

  private
  def stripe_token(params)
    Rails.env.test? ? generate_test_token : params[:stripeToken]
  end

  def generate_test_token
    StripeMock.generate_card_token
  end

  def check_env
    StripeMock.start if Rails.env.test?
  end
end
