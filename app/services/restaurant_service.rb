class RestaurantService
  def self.get_resturant(lat, lon, type)
    response = connection.get("businesses/search?categories=#{type}&location=#{lat}, #{lon}")
    body = JSON.parse(response.body, symbolize_names: true)[:businesses].first
    # binding.pry
  end

  def self.connection
    Faraday.new(url: 'https://api.yelp.com/v3/',
                headers: {'Authorization' => 'Bearer llFKl4YQSGryN4AvEdCkWS13yYb-sNbueMcFrEvwGBdBu8Sk8RIG3kSeod9p5ksV2CJfk969a8AoCA4EovVLl3FgCDZ6ZQeHZ0jGslV4VyHHxkKKiYt7ENagrCjxYnYx'})
  end
end
