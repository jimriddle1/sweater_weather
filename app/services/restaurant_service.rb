class RestaurantService
  def self.get_resturant(lat, lon, type)
    response = connection.get("businesses/search?categories=#{type}&location=#{lat}, #{lon}")
    body = JSON.parse(response.body, symbolize_names: true)[:businesses].first
  end

  def self.connection
    Faraday.new(url: 'https://api.yelp.com/v3/',
                headers: {'Authorization' => "Bearer #{ENV['yelp_api_key']}"})
  end
end
