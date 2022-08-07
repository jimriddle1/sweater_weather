class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hourly_weather_data)

    @time = Time.at(hourly_weather_data[:dt]).strftime("%H:%M:%S")
    @temperature = (1.8 * (hourly_weather_data[:temp] - 273) + 32)
    @conditions = hourly_weather_data[:weather].first[:description]
    @icon = hourly_weather_data[:weather].first[:icon]

  end

end
