# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customer1 = Customer.create(first_name: "Sleepy", last_name: "Bear", email: "sleepybearinachair@gmail.com", address: "222 Sleepy Guy Rd")

tea1 = Tea.create(title: "Oolong Opera Tea", description: "It's oolong tea with an alliterative name to catch your eye", temperature: 203, brew_time: 3)
tea2 = Tea.create(title: "Chamomile Corridor Tea", description: "It's chamomile tea with an alliterative name to catch your eye", temperature: 212, brew_time: 4)

subscription1 = Subscription.create(customer_id: customer1.id, title: "Single Box", frequency: 3, price: 10.30)

tea_subscription1 = TeaSubscription.create(tea_id: tea1.id, subscription_id: subscription1.id)
