require "rails_helper"

RSpec.describe "Customer Subscription endpoints" do
  describe "/api/v1/subscribe" do
    it "subscribes a customer to a tea subscription" do
      @cust = create(:customer, id: 1)
      @tea = create(:tea, id: 1)
      fe_params = {
        "customer_id": @cust.id,
        "tea_id": @tea.id,
        "title": "Oolong Opera",
        "frequency": 3,
        "price": 10.30
      }

      post "/api/v1/subscribe", params: fe_params, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      sub_response = JSON.parse(response.body, symbolize_names: true)
      expect(sub_response[:message]).to eq("Sucessfully subcribed #{@tea.title} to #{@cust.first_name}'s account")
    end

    it "returns an error if the customer does not exist" do
      @cust = create(:customer, id: 1)
      @tea = create(:tea, id: 1)
      fe_params = {
        "customer_id": 4,
        "tea_id": @tea.id,
        "title": "Oolong Opera",
        "frequency": 3,
        "price": 10.30
      }

      post "/api/v1/subscribe", params: fe_params, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      sub_response = JSON.parse(response.body, symbolize_names: true)
      expect(sub_response[:message]).to eq("Subscription NOT successful, please create an account or login to an existing account")
    end
  end
end