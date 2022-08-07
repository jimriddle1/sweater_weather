class GeocodeService
  def self.get_coordinates(location)
    response = connection.get("address/?key=#{ENV['map_quest_key']}&location=#{location}")
    body = JSON.parse(response.body, symbolize_names: true)
    body[:results][0][:locations][0][:latLng]
    # binding.pry
  end

  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/')
  end
end


# http://www.mapquestapi.com/geocoding/v1/address/?key=jySLMdxKQGR611P3LcbkFXOei7PeKF4c&location=chicago, IL
