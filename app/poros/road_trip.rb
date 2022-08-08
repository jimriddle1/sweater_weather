class RoadTrip
  attr_reader :origin, :destination, :travel_time

  def initialize(road_trip_data)

    @origin = road_trip_data[1]
    @destination = road_trip_data[2]
    @travel_time = road_trip_data[0]

  end

end
