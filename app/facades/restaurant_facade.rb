# frozen_string_literal: true

class RestaurantFacade

  def self.get_resturant(lat, lng, type)
    restaurant_data = RestaurantService.get_resturant(lat, lng, type)
    Restaurant.new(restaurant_data)
  end

end
