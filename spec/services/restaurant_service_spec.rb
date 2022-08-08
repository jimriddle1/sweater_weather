# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RestaurantService' do

    it 'returns a restaurant given some params' do
      coordinates = GeocodeService.get_coordinates("Chicago, IL")
      parsed_json = RestaurantService.get_resturant(coordinates[:lat], coordinates[:lng], "Mexican")


      expect(parsed_json).to be_a Hash
      expect(parsed_json[:name]).to be_a String
      expect(parsed_json[:location][:city]).to be_a String
      expect(parsed_json[:location][:state]).to be_a String
      expect(parsed_json[:location][:display_address][0]).to be_a String
      expect(parsed_json[:location][:display_address][1]).to be_a String


    end

  end
