class AddStripeSubscriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_subscription, :string
  end
end
