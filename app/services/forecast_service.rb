class ForecastService
  def self.get_forecast(lat, lon)
    response = connection.get("onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{ENV['open_weather_key']}")
    # binding.pry
    body = JSON.parse(response.body, symbolize_names: true)
    # body[:results][0][:locations][0][:latLng]
  end

  def self.connection
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/')
  end
end


# http://www.mapquestapi.com/geocoding/v1/address/?key=jySLMdxKQGR611P3LcbkFXOei7PeKF4c&location=chicago, IL
# https://api.openweathermap.org/data/2.5/onecall?lat={41.883229}&lon={-87.632398}&appid={a8d2653ddadbdd143811a2815e3c9ce5}
# response = connection.get("address/?key=#{ENV['map_quest_key']}&location=#{location}")
# https://api.openweathermap.org/data/2.5/onecall?lat=41.883229&lon=-87.632398&exclude=minutely,alerts,hourly,daily&appid=a8d2653ddadbdd143811a2815e3c9ce5
