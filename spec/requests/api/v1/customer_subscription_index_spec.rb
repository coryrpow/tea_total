require "rails_helper"

RSpec.describe "Customer Subscription Index endpoints" do
  describe "/api/v1/subscription_all" do
    it "displays both active and cancelled subscriptions for a customer" do
      @cust = create(:customer, id: 2)
      @tea1 = create(:tea, id: 3)
      @tea2 = create(:tea, id: 4)
      @tea3 = create(:tea, id: 5)
      @subscription1 = create(:subscription, id: 6, customer_id: @cust.id)
      @subscription2 = create(:subscription, id: 7, customer_id: @cust.id)
      # making the 3rd one to test that it displays even if cancelled
      @subscription3 = create(:subscription, id: 8, customer_id: @cust.id, status: 1)
      @tea_subscription1 = TeaSubscription.create(tea_id: @tea1.id, subscription_id: @subscription1.id)
      @tea_subscription2 = TeaSubscription.create(tea_id: @tea2.id, subscription_id: @subscription2.id)
      @tea_subscription3 = TeaSubscription.create(tea_id: @tea3.id, subscription_id: @subscription3.id)

      fe_params = {
       "customer_id": @cust.id
      }
     

      get "/api/v1/subscription_all", params: fe_params

      expect(response).to be_successful
      expect(response.status).to eq(200)

      sub_response = JSON.parse(response.body, symbolize_names: true)

      expect(sub_response).to be_a(Hash)
      expect(sub_response[:data].count).to eq(3)
      expect(sub_response[:data]).to be_a(Array)
   

     sub_response[:data].each do |sub|
      expect(sub[:attributes]).to have_key(:id)
      expect(sub[:attributes]).to have_key(:title)
      expect(sub[:attributes]).to have_key(:price)
      expect(sub[:attributes]).to have_key(:frequency)
      expect(sub[:attributes]).to have_key(:status)

      expect(sub[:attributes][:id]).to be_a(Integer)
      expect(sub[:attributes][:title]).to be_a(String)
      expect(sub[:attributes][:price]).to be_a(Integer)
      expect(sub[:attributes][:frequency]).to be_a(Integer)
      expect(sub[:attributes][:status]).to be_a(String)
     end
    end

    it "returns an error if the customer does not exist" do
      get "/api/v1/subscription_all", params: {customer_id: 500}
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      sub_response = JSON.parse(response.body, symbolize_names: true)
      expect(sub_response[:message]).to eq("Customer does not exist.")
    end
  end
end