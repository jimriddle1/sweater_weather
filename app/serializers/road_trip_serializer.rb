class RoadTripSerializer

  def self.setup_good_road_trip(info)
    {
      "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
          "start_city": info[:start_city],
          "end_city": info[:end_city],
          "travel_time": info[:travel_time],
          "weather_at_eta": {
            "temperature": info[:temperature].round(1),
            "conditions": info[:conditions]
          }
        }
      }
    }
  end

  def self.setup_impossible_road_trip(info)
    {
      "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
          "start_city": info[:start_city],
          "end_city": info[:end_city],
          "travel_time": info[:travel_time],
          "weather_at_eta": {},
        }
      }
    }
  end
end
