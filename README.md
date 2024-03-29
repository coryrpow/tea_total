# Tea Total
Created by: Cory Powell | [LinkedIn](https://www.linkedin.com/in/coryrpow/)
## Directory
- [Project Description](https://github.com/coryrpow/tea_total?tab=readme-ov-file#project-description)
- [Built Using](https://github.com/coryrpow/tea_total?tab=readme-ov-file#built-using)
- [Testing](https://github.com/coryrpow/tea_total?tab=readme-ov-file#testing)
- [Database Visualization](https://github.com/coryrpow/tea_total?tab=readme-ov-file#database-visualization)
- [Installation Instructions](https://github.com/coryrpow/tea_total?tab=readme-ov-file#installation-instructions)
- [Learning Goals](https://github.com/coryrpow/tea_total?tab=readme-ov-file#learning-goals)
- [API Documentation](https://github.com/coryrpow/tea_total?tab=readme-ov-file#api-documentation)
  - [POST subscribe](https://github.com/coryrpow/tea_total?tab=readme-ov-file#subscribe-a-customer-to-a-tea-subscription)
  - [PATCH cancel](https://github.com/coryrpow/tea_total?tab=readme-ov-file#cancel-a-customers-tea-subscription)
  - [GET subscription_all](https://github.com/coryrpow/tea_total?tab=readme-ov-file#see-all-of-a-customers-subscriptions-active-and-cancelled)
  
## Project Description
> This application serves as the back-end of an app that:
> - Allows Customers to add Subscriptions of Tea to their account
> - Allows Customers to cancel Subscriptions of already subscribed teas
> - Allows Customers to view all of their Subscriptions both active and cancelled.

## Built Using
- [Ruby 3.2.2](https://github.com/ruby/ruby)
- [Rails 7.1.2](https://github.com/rails/rails)

### Testing
- [RSpec 3.12](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)

## Database Visualization
![Tea Total Schema Visualization](https://gist.github.com/assets/132625822/6b21f5fe-ea09-416a-9abf-73e024d00d60)

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails server` 

## Learning Goals
- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- TDD
- Clear Documentation

## API Documentation

### Subscribe a customer to a tea subscription

`POST /api/v1/subscribe`

Note: This response mimics a theoretical front end sending you JSON body of a user subscribing to a tea. An example would look like this:
```
{
        "customer_id": 1,
        "tea_id": 1,
        "title": "Single Box",
        "frequency": 3,
        "price": 10.30
      }

```
#### In order to see how this mock JSON body example would work in Postman:
- Open Postman and click the `+` button in the upper right hand side
- In the text box next to the `GET` with the field `Enter URL or past text` enter in the url <your localhost>/api/v1/subscribe
- Click on the drop down button to the right of the `GET ` and select `POST`
- Select the `Body` tab, below the url
- Click the dropdown button to the right of `none` and select `raw`
- Enter the example body above in to this raw field
- You are now ready to click the Blue `Send` button and see the response

**Example response:**
```
 {
    "message": "Successfully subscribed Oolong Opera Tea to Sleepy's account"
}

```
___
### Cancel a customer's tea subscription

`PATCH "/api/v1/cancel"`

Note: This response mimics a theoretical front end sending you JSON body of a user cancelling a subscription they are already subscribed to. An example would look like this:
```
{
       "subscription_id": "1",
       "status": "1"
      }

```
#### In order to see how this mock JSON body example would work in Postman:
- Open Postman and click the `+` button in the upper right hand side
- In the text box next to the `GET` with the field `Enter URL or past text` enter in the url <your localhost>/api/v1/cancel
- Click on the drop down button to the right of the `GET ` and select `PATCH`
- Select the `Body` tab, below the url
- Click the dropdown button to the right of `none` and select `raw`
- Enter the example body above in to this raw field
- You are now ready to click the Blue `Send` button and see the response


**Example response:**
```
{
    "message": "Subscription updated!"
}

```

___
### See all of a customer's subscriptions (active and cancelled)

`GET "/api/v1/subscription_all"`

Note: This response mimics a theoretical front end sending you JSON body of a user cancelling a subscription they are already subscribed to. An example would look like this:
```
{
       "customer_id": "1"
      }

```
#### In order to see how this mock JSON body example would work in Postman:
- Open Postman and click the `+` button in the upper right hand side
- In the text box next to the `GET` with the field `Enter URL or past text` enter in the url <your localhost>/api/v1/subsvcription_all
- Ensure that `GET ` is selected for the type of request (defaults to `GET`)
- Select the `Body` tab, below the url
- Click the dropdown button to the right of `none` and select `raw`
- Enter the example body above in to this raw field
- You are now ready to click the Blue `Send` button and see the response



**Example response:**
```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "id": 1,
                "title": "Single Box",
                "price": 10,
                "frequency": 3,
                "status": "active"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "id": 2,
                "title": "Single Box",
                "price": 10,
                "frequency": 2,
                "status": "active"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "id": 3,
                "title": "Single Box",
                "price": 12,
                "frequency": 2,
                "status": "cancelled"
            }
        }
    ]
}

```
___
