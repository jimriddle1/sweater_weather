# frozen_string_literal: true

class ForecastFacade

  def self.get_forecast(lat, lon)
    forecast_data = ForecastService.get_forecast(lat, lon)
  end

  def self.get_future_forecast(lat, lon, duration)
    if duration.nil?
      return nil
    else
      forecast_data = ForecastService.get_forecast(lat, lon)
      hours = duration[0..1].to_i
      if hours <= 48
        HourlyWeather.new(forecast_data[:hourly][hours])
      else
        days = (hours/24).to_i
        DailyWeather.new(forecast_data[:daily][days])
      end
    end
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
