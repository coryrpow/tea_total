class Api::V1::SubscriptionsController < ApplicationController
  def create
    begin
      customer = Customer.find(fe_params[:customer_id])
      tea = Tea.find(fe_params[:tea_id])
      subscription = customer.subscriptions.create(
        title: fe_params[:title],
        frequency: fe_params[:frequency],
        price: fe_params[:price],
        )
      tea_subscription = TeaSubscription.create(tea_id: tea.id, subscription_id: subscription.id)
      render json: { message: "Sucessfully subcribed #{tea.title} to #{customer.first_name}'s account"}, status: 201
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Subscription NOT successful, please create an account or login to an existing account"}, status: 400
    end
  end

private 

  def fe_params
    params.permit(:customer_id, :tea_id, :title, :frequency, :price)
  end

end