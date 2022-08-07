# frozen_string_literal: true

class GeocodeFacade

  def self.get_coordinates(address)
    geocode_data = GeocodeService.get_coordinates(address)
    Geocode.new(geocode_data)
  end

end
