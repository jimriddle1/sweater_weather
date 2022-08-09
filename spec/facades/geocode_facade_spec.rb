# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GeocodeFacade' do
  it 'gives me a geocode object given an address', :vcr do
    geocode = GeocodeFacade.get_coordinates("Chicago, IL")

    expect(geocode).to be_a Geocode
  end

  it 'gives me a roadtrip object given an origin and destination', :vcr do
    roadtrip = GeocodeFacade.get_route("Chicago, IL", "Nashville, TN")

    expect(roadtrip).to be_a RoadTrip
  end

end
