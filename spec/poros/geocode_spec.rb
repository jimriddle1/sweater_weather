# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Geocode do

  it 'populates Geocode fields from JSON response' do
    geocode_data = {:lat=>41.883229, :lng=>-87.632398}
    geocode = Geocode.new(geocode_data)

    expect(geocode).to be_a Geocode
    expect(geocode.lat).to eq(geocode_data[:lat])
    expect(geocode.lng).to eq(geocode_data[:lng])


  end

end
