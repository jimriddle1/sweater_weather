class ForecastService
  def self.get_forecast(lat, lon)
    response = connection.get("onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{ENV['open_weather_key']}")
    body = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/')
  end
end
