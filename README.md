
---

# Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc)

---


# API Usage



- Available Endpoints:
  - [Weather Endpoints](#WEATHER)
  	- <a href="https://developer.mapquest.com/documentation/geocoding-api/"><strong>Instructions to setup a Mapquest Geocode API »</strong></a>
	- <a href="https://openweathermap.org/api/one-call-api"><strong>Instructions to setup a OpenWeather API »</strong></a>
  - [User Endpoints](#USER)
  - [Road Trip Endpoints](#ROADTRIP)
  	- <a href="https://developer.mapquest.com/documentation/directions-api/"><strong>Instructions to setup a Mapquest Directions API »</strong></a>



---

# WEATHER


**Get Weather**

- This endpoint consumes data returned from Geocode and OpenWeather, and returns current daily and hourly weather of a given location. 
	

``` ruby
[GET] /api/v1/forecast

```

 Example:

``` ruby 
[GET] /api/v1/forecast?location=chicago,il


```

RESPONSE:

```json
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
---

# USER


**Create User**

- This endpoint creates a user 
	

``` ruby
[POST] /api/v1/users/


Required BDOY: 
 - email
 - password
 - password confirmation
```

 Example:

``` ruby 
[POST] /api/v1/users/

 - Body: 
	 {
	  "email": "whatever@example.com",
	  "password": "password",
	  "password_confirmation": "password"
	}
```

RESPONSE:

```json
{
	"data": {
		"type": "users",
		"id": "1",
		"attributes": {
			"email": "whatever@example.com",
			"api_key": "abcdefg"
		}
	}
}
```
---


**Login User**

- This endpoint logs in a user 
	

``` ruby
[POST] /api/v1/sessions/


Required BDOY: 
 - email
 - password
```

 Example:

``` ruby 
[POST] /api/v1/sessions/

 - Body: 
	 {
	  "email": "whatever@example.com",
	  "password": "password"
	}
```

RESPONSE:

```json
{
	"data": {
		"type": "users",
		"id": "1",
		"attributes": {
			"email": "whatever@example.com",
			"api_key": "abcdefg"
		}
	}
}
```
---

# ROADTRIP


**Create Plant**

- This endpoint creates a garden for a user 
	

``` ruby
[POST]  /api/v1/users/:user_id/gardens/:garden_id/plants


Required PARAMS: 
 - _json: plant_data.to_json
```

 Example:

``` ruby 
[POST]  /api/v1/users/:user_id/gardens/:garden_id/plants

 - Params: 
	 - _json: "{\"user_id\":\"1\",\"garden_id\":\"1\",\"name\":\"Carrot\",\"plant_id\":\"sae2340987dage\"}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": null,
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---


**Garden Plants**

- This endpoint returns all the plants for a garden
	

``` ruby
[GET] /api/v1/users/:user_id/gardens/:garden_id/plants
```

RESPONSE:

```json
{
	"data": [
		{
			"id": "1",
			"type": "plant",
			"attributes": {
				"name": "Carrot",
				"plant_id": "sae2340987dage",
				"date_planted": null,
				"moon_phase": null,
				"date_matured": null,
				"bounty_amount": null,
				"pruning_behaviors": null,
				"notes": null,
				"garden_id": 1
			}
		},
		{
			"id": "2",
			"type": "plant",
			"attributes": {
				"name": "Carrot",
				"plant_id": "sae2340987dage",
				"date_planted": null,
				"moon_phase": null,
				"date_matured": null,
				"bounty_amount": null,
				"pruning_behaviors": null,
				"notes": null,
				"garden_id": 1
			}
		}
	]

}
```
---

**Plant Show**

- This endpoint returns a particular plant
	

``` ruby
[GET] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": null,
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---
**Plant Destroy**

- This endpoint destroys a particular plant
	

``` ruby
[DELETE] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

RESPONSE:

```json
No Response
```
---
**Plant Update**

- This endpoint updates a particular plant
	

``` ruby
[PATCH] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

 Example:

``` ruby 
[PATCH] /api/v1/users/:user_id/gardens/:garden_id/plants/:id


 - Params: 
	 - _json : "{\"moon_phase\":\"Full\"}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": "Full",
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---

# Feel like messing around?


## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:Bone-TM/bone_FE.git

```

  

2. Install gems for development using [Bundler](https://bundler.io/guides/using_bundler_in_applications.html#getting-started---installing-bundler-and-bundle-init):

```

$ bundle install

```

  

3. Set up your database with:

```

$ rails db:{drop,create,migrate}

```

  

4. Run the test suite with:

```

$ bundle exec rspec

```

  

5. Run your development server with:

```

$ rails s

```

  

6. In your browser, visit ['localhost:3000/`](http://localhost:3000/) to see the app in action.





