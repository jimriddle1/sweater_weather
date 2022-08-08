class GeocodeService
  def self.get_coordinates(location)
    response = connection.get("geocoding/v1/address/?key=#{ENV['map_quest_key']}&location=#{location}")
    body = JSON.parse(response.body, symbolize_names: true)
    body[:results][0][:locations][0][:latLng]
    # binding.pry
  end

  def self.get_route(origin, destination)
    response = connection.get("directions/v2/route?key=#{ENV['map_quest_key']}&from=#{origin}&to=#{destination}")
    body = JSON.parse(response.body, symbolize_names: true)
    [body[:route][:formattedTime], origin, destination]
  end

  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com/')
  end
end
