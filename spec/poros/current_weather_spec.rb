# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentWeather do

  it 'populates CurrentWeather fields from JSON response' do
    require 'date'

    current_weather_data = {
  		"dt": 1659897832,
  		"sunrise": 1659869424,
  		"sunset": 1659920533,
  		"temp": 297.77,
  		"feels_like": 298.61,
  		"pressure": 1019,
  		"humidity": 89,
  		"dew_point": 295.84,
  		"uvi": 0.83,
  		"clouds": 100,
  		"visibility": 10000,
  		"wind_speed": 1.79,
  		"wind_deg": 255,
  		"wind_gust": 2.68,
  		"weather": [
  			{
  				"id": 500,
  				"main": "Rain",
  				"description": "light rain",
  				"icon": "10d"
  			}
  		]
  		}

    current_weather = CurrentWeather.new(current_weather_data)

    expect(current_weather).to be_a CurrentWeather

    expect(current_weather.datetime).to eq(Time.at(current_weather_data[:dt]))
    expect(current_weather.sunrise).to eq(Time.at(current_weather_data[:sunrise]))
    expect(current_weather.sunset).to eq(Time.at(current_weather_data[:sunset]))
    expect(current_weather.temperature).to eq(1.8 * (current_weather_data[:temp] - 273) + 32)
    expect(current_weather.feels_like).to eq(1.8 * (current_weather_data[:feels_like] - 273) + 32)
    expect(current_weather.humidity).to eq(current_weather_data[:humidity])
    expect(current_weather.uvi).to eq(current_weather_data[:uvi])
    expect(current_weather.visibility).to eq(current_weather_data[:visibility])
    expect(current_weather.conditions).to eq(current_weather_data[:weather].first[:description])
    expect(current_weather.icon).to eq(current_weather_data[:weather].first[:icon])

  end

end
