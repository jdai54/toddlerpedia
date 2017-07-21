class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key]}",
      description: "Premium Membership - #{current_user}",
      amount: Amount.default
    }
  end

  def create
    # amount = Amount.default
    # plan = Stripe::Plan.create(
    #   :name => "Premium Plan",
    #   :id => "premium-monthly",
    #   :interval => "month",
    #   :currency => "usd",
    #   :amount => Amount.default,
    # )
    # Creates a Stripe Customer object, for associating with the ChargesController
    customer = Stripe::Customer.create(
      :email => current_user,
      :source => params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )
    current_user.premium!
    flash[:notice] = "Welcome to premium membership, #{current_user.email}! Start creating private wikis, and enjoy all the other benefits of premium membership today."
    redirect_to wikis_path

    # subscription = Stripe::Subscription.create(
    #   :customer => customer.id,
    #   :plan => "premium-monthly",
    # )
    # current_user.update_attributes(stripe_id: customer.id)
    # current_user.update_attributes(stripe_subscription: subscription.id)
    # current_user.update_attributes(role: 'premium')
    # flash[:notice] = "Welcome to premium membership, #{current_user.email}! Start creating private wikis, and enjoy all the other benefits of premium membership today."
    # redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    def delete
      current_user.standard!
      redirect_to edit_user_registration_path
      flash[:notice] = "Membership level changed to standard. Remember, you can upgrade at anytime."
    end

  #
  #   # Stripe will send back CardErrors, with friendly messages when something goes wrong.
  #   # This 'rescue block' catches and displays those errors.
  # rescue Stripe::CardError => e
  #   flash[:alert] = e.message
  #   redirect_to new_charge_path
  # end
end
