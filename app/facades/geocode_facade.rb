# frozen_string_literal: true

class GeocodeFacade

  def self.get_coordinates(address)
    geocode_data = GeocodeService.get_coordinates(address)
    Geocode.new(geocode_data)
  end

  def self.get_route(origin, destination)
    route_data = GeocodeService.get_route(origin, destination)
    RoadTrip.new(route_data)
  end

end
