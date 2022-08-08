class Api::V1::RestaurantController < ApplicationController

  def show
    coordinates = GeocodeFacade.get_coordinates(params[:location])
    entire_forecast = ForecastFacade.get_forecast(coordinates.lat, coordinates.lng)
    info = {
      current_weather: ForecastFacade.current_weather(entire_forecast),
      restaurant_info: RestaurantFacade.get_resturant(coordinates.lat, coordinates.lng, params[:food])

    }
    render json: RestaurantSerializer.setup_restaurant(info)
  end

end
