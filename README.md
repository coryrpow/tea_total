# Tea Total
Created by: Cory Powell | [LinkedIn](https://www.linkedin.com/in/coryrpow/)
## Directory
<!-- - [Project Description](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#project-description)
- [Dates](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#datess)
- [Built Using](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#built-using)
- [Testing](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#testing)
- [Installation Instructions](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#installation-instructions)
- [Requirements](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#requirements)
- [Learning Goals](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#learning-goals)
- [API Documentation](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#api-documentation)
  - [GET forecast](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#retrieve-weather-forecast-for-a-city)
  - [POST users](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#user-registration)
  - [POST login](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#login)
  - [POST Road Trip](https://github.com/coryrpow/sweater_weather?tab=readme-ov-file#road-trip) -->

  
## Project Description
> This application serves as the back-end of an app that:
> - Displays a weather forecast for a city on the landing page
> - Registers users in the database and creates an api_key unique to each registered user
> - Allows existing users to log back in
> - Grants users the ability to plan road trips where they see the current weather, as well as the forecasted weather at the destination
>
> This application makes all of that possible by exposing multiple API endpoints and formatting the needed data to meet the needs of the front end.

## Built Using
- [Ruby 3.2.2](https://github.com/ruby/ruby)
- [Rails 7.1.2](https://github.com/rails/rails)

### Testing
- [RSpec 3.12](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)

## Database visualization
![Tea Total Schema Visualization](https://gist.github.com/assets/132625822/6b21f5fe-ea09-416a-9abf-73e024d00d60)

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails server` 


## Requirements


## Learning Goals
- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- TDD
- Clear Documentation

## API Documentation

### Subscribe a customer to a tea subscription

`POST /api/v1/subscribe`

**Example response:**
```
 

```
___
### Cancel a customer's tea subscription

`POST "/api/v1/cancel"`

Note: This response mimics a theoretical front end sending you JSON body of a user registering for the site. An example would look like this:
```

```
#### In order to see how this mock JSON body example would work in Postman:
- Open Postman and click the `+` button in the upper right hand side
- In the text box next to the `GET` with the field `Enter URL or past text` enter in the url <your localhost>/api/v0/users
- Click on the drop down button to the right of the `GET ` and select `POST`
- Select the `Body` tab, below the url
- Click the dropdown button to the right of `none` and select `raw`
- Enter the example body above in to this raw field
- You are now ready to click the Blue `Send` button and see the response


**Example response:**
```

```

___
### See all of a customer's subscriptions (active and cancelled)

`GET "/api/v1/subscriptions"`

Note: This response mimics a theoretical front end user that has already created an account, sending you JSON body. An example would look like this:
```

```
#### In order to see how this mock JSON body example would work in Postman:
- Open Postman and click the `+` button in the upper right hand side
- In the text box next to the `GET` with the field `Enter URL or past text` enter in the url <your localhost>/api/v0/sessions
- Click on the drop down button to the right of the `GET ` and select `POST`
- Select the `Body` tab, below the url
- Click the dropdown button to the right of `none` and select `raw`
- Enter the example body above in to this raw field
- You are now ready to click the Blue `Send` button and see the response


**Example response:**
```

```
___# tea_total
