# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  it 'gives me a current, daily, and hourly object given coordinates' do
    coordinates = GeocodeService.get_coordinates("Chicago, IL")

    forecast_data = ForecastFacade.get_forecast(coordinates[:lat], coordinates[:lng])

    current_weather = ForecastFacade.current_weather(forecast_data)
    daily_weather = ForecastFacade.daily_weather(forecast_data)
    hourly_weather = ForecastFacade.hourly_weather(forecast_data)

    expect(current_weather).to be_a CurrentWeather
    expect(daily_weather).to be_all DailyWeather
    expect(hourly_weather).to be_all HourlyWeather

    expect(daily_weather.count).to eq(5)
    expect(hourly_weather.count).to eq(8)
  end

end
