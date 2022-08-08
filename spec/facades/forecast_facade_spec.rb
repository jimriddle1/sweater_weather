# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  it 'gives me a current, daily, and hourly object given coordinates', :vcr do
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

  it 'gives me a hourly weather given coordinates for a trip under 48 hours', :vcr do

    road_trip = GeocodeFacade.get_route("Chicago, IL", "Nashville, TN")
    coordinates = GeocodeService.get_coordinates(road_trip.destination)

    future_forecast_data = ForecastFacade.get_future_forecast(coordinates[:lat], coordinates[:lng], road_trip.travel_time)
    expect(future_forecast_data).to be_a HourlyWeather

  end

  it 'gives me a daily weather given coordinates for a trip over 48 hours', :vcr do

    road_trip = GeocodeFacade.get_route("New York, NY", "Panama City, Panama")
    coordinates = GeocodeService.get_coordinates(road_trip.destination)

    future_forecast_data = ForecastFacade.get_future_forecast(coordinates[:lat], coordinates[:lng], road_trip.travel_time)
    expect(future_forecast_data).to be_a DailyWeather
  end

  it 'returns nil if the trip does not exist', :vcr do

    road_trip = GeocodeFacade.get_route("New York, NY", "Paris, France")
    coordinates = GeocodeService.get_coordinates(road_trip.destination)

    future_forecast_data = ForecastFacade.get_future_forecast(coordinates[:lat], coordinates[:lng], road_trip.travel_time)
    expect(future_forecast_data).to eq(nil)
  end

end
