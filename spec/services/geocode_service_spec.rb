# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GeocodeService' do

    it 'returns a lat and long given a location' do
      parsed_json = GeocodeService.get_coordinates("Chicago, IL")

      expect(parsed_json).to be_a Hash

      coordinates = parsed_json

      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)

    end
end
