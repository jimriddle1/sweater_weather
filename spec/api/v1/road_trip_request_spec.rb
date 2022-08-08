require 'rails_helper'

RSpec.describe 'User API' do
  before(:each) do
    @header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post "/api/v1/users", headers:@header, params: JSON.generate(body)

  end
  it 'returns weather conditions estimate based on arrival time', :vcr do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{User.last.api_key}"
      }
    post "/api/v1/road_trip", headers:@header, params: JSON.generate(body)

    expect(response.status).to eq(200)

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]

    expect(data[:id]).to eq("null")
    expect(data[:type]).to eq("road_trip")

    road_trip_attributes = data[:attributes]

    expect(road_trip_attributes).to be_a Hash
    expect(road_trip_attributes[:start_city]).to be_a String
    expect(road_trip_attributes[:end_city]).to be_a String
    expect(road_trip_attributes[:travel_time]).to be_a String
    expect(road_trip_attributes[:weather_at_eta]).to be_a Hash

    weather_at_eta = road_trip_attributes[:weather_at_eta]
    expect(weather_at_eta[:temperature]).to be_a Float
    expect(weather_at_eta[:conditions]).to be_a String

  end

  it 'returns an error if the API key does not exist in the system', :vcr do

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "abcdefg"
      }
    post "/api/v1/road_trip", headers:@header, params: JSON.generate(body)

    expect(response.status).to eq(401)

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]
    expect(data[:errors]).to eq("Please include a valid API key")

  end


end
