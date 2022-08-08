# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RestaurantFacade' do
  it 'gives me a restaurant object given coordinates and a food type' do
    coordinates = GeocodeService.get_coordinates("Chicago, IL")
    restaurant = RestaurantFacade.get_resturant(coordinates[:lat], coordinates[:lng], "Mexican")

    expect(restaurant).to be_a Restaurant
  end

end
