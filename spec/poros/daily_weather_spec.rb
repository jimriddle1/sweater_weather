# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyWeather do

  it 'populates DailyWeather fields from JSON response' do

    daily_weather_data = 	{
    			"dt": 1659891600,
    			"sunrise": 1659869424,
    			"sunset": 1659920533,
    			"moonrise": 1659907740,
    			"moonset": 1659850680,
    			"moon_phase": 0.33,
    			"temp": {
    				"day": 297.69,
    				"min": 296.41,
    				"max": 299.22,
    				"night": 296.41,
    				"eve": 297.6,
    				"morn": 296.48
    			},
    			"feels_like": {
    				"day": 298.58,
    				"night": 297.25,
    				"eve": 298.45,
    				"morn": 297.38
    			},
    			"pressure": 1018,
    			"humidity": 91,
    			"dew_point": 296.12,
    			"wind_speed": 4.31,
    			"wind_deg": 206,
    			"wind_gust": 9.94,
    			"weather": [
    				{
    					"id": 501,
    					"main": "Rain",
    					"description": "moderate rain",
    					"icon": "10d"
    				}
    			],
    			"clouds": 100,
    			"pop": 1,
    			"rain": 12.92,
    			"uvi": 1.49
    		}

    daily_weather = DailyWeather.new(daily_weather_data)

    expect(daily_weather).to be_a DailyWeather

    expect(daily_weather.datetime).to eq(Time.at(daily_weather_data[:dt]).strftime("%Y/%m/%d"))
    expect(daily_weather.sunrise).to eq(Time.at(daily_weather_data[:sunrise]))
    expect(daily_weather.sunset).to eq(Time.at(daily_weather_data[:sunset]))
    expect(daily_weather.max_temp).to eq(1.8 * (daily_weather_data[:temp][:max] - 273) + 32)
    expect(daily_weather.min_temp).to eq(1.8 * (daily_weather_data[:temp][:min] - 273) + 32)
    expect(daily_weather.conditions).to eq(daily_weather_data[:weather].first[:description])
    expect(daily_weather.icon).to eq(daily_weather_data[:weather].first[:icon])

  end

end
