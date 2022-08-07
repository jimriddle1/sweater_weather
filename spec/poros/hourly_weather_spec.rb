# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HourlyWeather do

  it 'populates hourlyWeather fields from JSON response' do

    hourly_weather_data = 	{
			"dt": 1659895200,
			"temp": 297.72,
			"feels_like": 298.58,
			"pressure": 1019,
			"humidity": 90,
			"dew_point": 295.97,
			"uvi": 1.49,
			"clouds": 100,
			"visibility": 10000,
			"wind_speed": 2.73,
			"wind_deg": 240,
			"wind_gust": 6.02,
			"weather": [
				{
					"id": 500,
					"main": "Rain",
					"description": "light rain",
					"icon": "10d"
				}
			],
			"pop": 1,
			"rain": {
				"1h": 0.67
			}
		}

    hourly_weather = HourlyWeather.new(hourly_weather_data)

    expect(hourly_weather).to be_a HourlyWeather

    expect(hourly_weather.time).to eq(Time.at(hourly_weather_data[:dt]).strftime("%H:%M:%S"))
    expect(hourly_weather.temperature).to eq(1.8 * (hourly_weather_data[:temp] - 273) + 32)
    expect(hourly_weather.conditions).to eq(hourly_weather_data[:weather].first[:description])
    expect(hourly_weather.icon).to eq(hourly_weather_data[:weather].first[:icon])

  end

end
