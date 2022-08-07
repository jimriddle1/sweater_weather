class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_weather_data)

    @datetime = Time.at(current_weather_data[:dt])
    @sunrise = Time.at(current_weather_data[:sunrise])
    @sunset = Time.at(current_weather_data[:sunset])
    @temperature = (1.8 * (current_weather_data[:temp] - 273) + 32)
    @feels_like = (1.8 * (current_weather_data[:feels_like] - 273) + 32)
    @humidity = current_weather_data[:humidity]
    @uvi = current_weather_data[:uvi]
    @visibility = current_weather_data[:visibility]
    @conditions = current_weather_data[:weather].first[:description]
    @icon = current_weather_data[:weather].first[:icon]

  end

end
