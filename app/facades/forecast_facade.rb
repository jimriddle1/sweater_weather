# frozen_string_literal: true

class ForecastFacade

  def self.get_forecast(lat, lon)
    forecast_data = ForecastService.get_forecast(lat, lon)
  end

  def self.current_weather(forecast_data)
    current_weather_data = forecast_data[:current]
    CurrentWeather.new(current_weather_data)
  end

  def self.daily_weather(forecast_data)
    daily_weather_data = forecast_data[:daily].first(5)
    daily_weather_data.map do |data|
      DailyWeather.new(data)
    end
  end

  def self.hourly_weather(forecast_data)
    hourly_weather_data = forecast_data[:hourly].first(8)
    hourly_weather_data.map do |data|
      HourlyWeather.new(data)
    end
  end

end
