require "rails_helper"

RSpec.describe "Cancel Customer Subscription endpoints" do
  describe "/api/v1/cancel" do
    it "cancels a customer's tea subscription" do
      @cust = create(:customer, id: 2)
      @tea = create(:tea, id: 3)
      @subscription = create(:subscription, id: 6, customer_id: @cust.id)
      @tea_subscription = TeaSubscription.create(tea_id: @tea.id, subscription_id: @subscription.id)

      expect(@subscription.status).to eq("active")

      fe_params = {
       "subscription_id": @subscription.id,
       "status": "1"
      }

      patch "/api/v1/cancel", params: fe_params, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      sub_response = JSON.parse(response.body, symbolize_names: true)
      expect(sub_response[:message]).to eq("Subscription updated!")

      @subscription.reload
      expect(@subscription.status).to eq("cancelled")
    end

    it "returns an error if the customer does not exist" do
      @cust = create(:customer, id: 2)
      @tea = create(:tea, id: 3)
      @subscription = create(:subscription, id: 6, customer_id: @cust.id)
      @tea_subscription = TeaSubscription.create(tea_id: @tea.id, subscription_id: @subscription.id)

      expect(@subscription.status).to eq("active")

      fe_params = {
       "subscription_id": "17",
       "status": "1"
      }

      patch "/api/v1/cancel", params: fe_params, as: :json, headers: { "CONTENT_TYPE" => "application/json" }
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      sub_response = JSON.parse(response.body, symbolize_names: true)
      expect(sub_response[:message]).to eq("Subscription update failed!")
    end
  end
end