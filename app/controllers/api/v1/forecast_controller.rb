class Api::V1::ForecastController < ApplicationController

  def landing
    coordinates = GeocodeFacade.get_coordinates(params[:location])
    entire_forecast = ForecastFacade.get_forecast(coordinates.lat, coordinates.lng)
    forecast = {
      current: ForecastFacade.current_weather(entire_forecast),
      daily: ForecastFacade.daily_weather(entire_forecast),
      hourly: ForecastFacade.hourly_weather(entire_forecast)
    }
    # binding.pry
    render json: ForecastSerializer.setup_forecast(forecast)
  end

end
