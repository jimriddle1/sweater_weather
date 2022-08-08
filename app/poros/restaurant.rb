class Restaurant
  attr_reader :name, :destination_city, :address

  def initialize(restaurant_data)

    @name = restaurant_data[:name]
    @destination_city = "#{restaurant_data[:location][:city]}, #{restaurant_data[:location][:state]}"
    @address = "#{restaurant_data[:location][:display_address].join(", ")}"


  end

end
