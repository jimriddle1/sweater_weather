# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoadTrip do

  it 'populates RoadTrip fields from an array' do
    array = ["07:10:50", "Chicago, IL", "Nashville, TN"]
    roadtrip = RoadTrip.new(array)

    expect(roadtrip).to be_a RoadTrip
    expect(roadtrip.origin).to eq(array[1])
    expect(roadtrip.destination).to eq(array[2])
    expect(roadtrip.travel_time).to eq(array[0])
  end

end
