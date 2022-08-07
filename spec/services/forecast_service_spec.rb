# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ForecastService' do

    it 'returns a forcast given a location' do
      coordinates = GeocodeService.get_coordinates("Chicago, IL")
      parsed_json = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])

      data = parsed_json
      expect(data).to be_a Hash
      expect(data).to_not include :alerts, :minutely

      current = parsed_json[:current]
      expect(current).to be_a Hash

      expect(current).to include :dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility
      expect(current[:dt]).to be_a(Integer)
      expect(current[:sunrise]).to be_a(Integer)
      expect(current[:sunset]).to be_a(Integer)
      expect(current[:temp]).to be_a(Float)
      expect(current[:feels_like]).to be_a(Float)
      expect(current[:humidity]).to be_a(Integer)
      expect(current[:uvi]).to be_a(Float)
      expect(current[:visibility]).to be_a(Integer)

      current_weather = current[:weather].first
      expect(current_weather).to include :description, :icon

      expect(current_weather[:description]).to be_a(String)
      expect(current_weather[:icon]).to be_a(String)

      daily = parsed_json[:daily]
      expect(daily).to be_an Array

      first_day = daily.first
      expect(first_day).to include :dt, :sunrise, :sunset

      first_day_temp = first_day[:temp]
      expect(first_day_temp).to include :max, :min

      first_day_weather = first_day[:weather].first
      expect(first_day_weather).to include :description, :icon

      expect(first_day[:dt]).to be_a(Integer)
      expect(first_day[:sunrise]).to be_a(Integer)
      expect(first_day[:sunset]).to be_a(Integer)
      expect(first_day_temp[:max]).to be_a(Float)
      expect(first_day_temp[:min]).to be_a(Float)
      expect(first_day_weather[:description]).to be_a(String)
      expect(first_day_weather[:icon]).to be_a(String)

      hourly = parsed_json[:hourly]
      expect(hourly).to be_an Array

      first_hour = hourly.first
      expect(first_hour).to include :dt, :temp

      first_hour_weather = first_hour[:weather].first
      expect(first_hour_weather).to include :description, :icon

      expect(first_hour[:dt]).to be_a(Integer)
      expect(first_hour[:temp]).to be_a(Float)
      expect(first_hour_weather[:description]).to be_a(String)
      expect(first_hour_weather[:icon]).to be_a(String)
    end
end
