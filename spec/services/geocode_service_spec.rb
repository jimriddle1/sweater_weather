# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GeocodeService' do

    it 'returns a lat and long given a location', :vcr do
      parsed_json = GeocodeService.get_coordinates("Chicago, IL")

      expect(parsed_json).to be_a Hash

      coordinates = parsed_json

      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)

    end

    it 'returns route information when given a from and a to', :vcr do
      parsed_json = GeocodeService.get_route("Chicago, IL", "Nashville, TN")

      expect(parsed_json).to be_an Array

      route_info = parsed_json

      expect(route_info[0]).to be_a(String)
      expect(route_info[1]).to be_a(String)
      expect(route_info[2]).to be_a(String)

    end
end
