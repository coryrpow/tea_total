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
      render json: { message: "Successfully subscribed #{tea.title} to #{customer.first_name}'s account"}, status: 201
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Subscription NOT successful, please create an account or login to an existing account"}, status: 400
    end
  end

  def update
    begin
      subscription = Subscription.find(params[:subscription_id])
      subscription.update!(status: params[:status].to_i)
      render json: {message: "Subscription updated!"}, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: {message: "Subscription update failed!"}, status: 404
    end
  end

  def index
    begin
      customer = Customer.find(params[:customer_id])
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: 200
    rescue ActiveRecord::RecordNotFound
      render json: {message: "Customer does not exist."}, status: 404
    end
  end

private 

  def fe_params
    params.permit(:customer_id, :tea_id, :title, :frequency, :price)
  end

end