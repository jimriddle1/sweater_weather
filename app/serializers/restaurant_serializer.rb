class RestaurantSerializer

  def self.setup_restaurant(info)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": info[:restaurant_info].destination_city,
          "forecast": {
            "summary": info[:current_weather].conditions,
            "temperature": info[:current_weather].temperature.to_i
          },
          "restaurant": {
            "name": info[:restaurant_info].name,
            "address": info[:restaurant_info].address
          }
        }
      }
    }
  end
end
