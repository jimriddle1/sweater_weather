class Api::V1::RoadTripsController < ApplicationController

  def show
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { data: { errors: "Please include a valid API key"} }, status: 401
    else
      route_info = GeocodeFacade.get_route(params[:origin], params[:destination])
      coordinates = GeocodeFacade.get_coordinates(params[:destination])
      future_forecast = ForecastFacade.get_future_forecast(coordinates.lat, coordinates.lng, route_info.travel_time)
      if future_forecast.nil?
        info = {
          start_city: route_info.origin,
          end_city: route_info.destination,
          travel_time: "impossible",
        }
        render json: RoadTripSerializer.setup_impossible_road_trip(info)
      else
        info = {
          start_city: route_info.origin,
          end_city: route_info.destination,
          travel_time: route_info.travel_time,
          temperature: future_forecast.temperature,
          conditions: future_forecast.conditions
        }
        render json: RoadTripSerializer.setup_good_road_trip(info)
      end
    end
  end

end
