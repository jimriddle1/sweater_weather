# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RestaurantService' do

    it 'returns a restaurant given some params' do
      coordinates = GeocodeService.get_coordinates("Chicago, IL")
      parsed_json = ForecastService.get_resturant(coordinates[:lat], coordinates[:lng], "Chinese")

      data = parsed_json
      expect(data).to be_a Hash

    end

  end
