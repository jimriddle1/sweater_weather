class DailyWeather
  attr_reader :datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(daily_weather_data)

    @datetime = Time.at(daily_weather_data[:dt]).strftime("%Y/%m/%d")
    @sunrise = Time.at(daily_weather_data[:sunrise])
    @sunset = Time.at(daily_weather_data[:sunset])
    @max_temp = (1.8 * (daily_weather_data[:temp][:max] - 273) + 32)
    @min_temp = (1.8 * (daily_weather_data[:temp][:min] - 273) + 32)
    @conditions = daily_weather_data[:weather].first[:description]
    @icon = daily_weather_data[:weather].first[:icon]

  end

end
