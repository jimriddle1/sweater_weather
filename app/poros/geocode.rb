class Geocode
  attr_reader :lat, :lng

  def initialize(geocode_data)

    @lat = geocode_data[:lat]
    @lng = geocode_data[:lng]


  end

end
