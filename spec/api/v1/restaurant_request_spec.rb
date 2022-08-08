require 'rails_helper'

RSpec.describe 'Restaurant API' do
  it 'returns the the restaurant info based on locaiton and food type' do

    get "/api/v1/munchies?location=chicago,il,&food=mexican"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    restaurant = response_body[:data]

    expect(restaurant[:id]).to eq("null")
    expect(restaurant[:type]).to eq("munchie")

    restaurant_info = restaurant[:attributes]

    expect(restaurant_info).to be_a Hash

    expect(restaurant_info).to include :destination_city, :forecast, :restaurant
    expect(restaurant_info[:destination_city]).to be_a(String)
    expect(restaurant_info[:forecast]).to be_a(Hash)
    expect(restaurant_info[:restaurant]).to be_a(Hash)

    restaurant_forecast = restaurant_info[:forecast]
    expect(restaurant_forecast[:summary]).to be_a(String)
    expect(restaurant_forecast[:temperature]).to be_a(Integer)

    restaurant_details = restaurant_info[:restaurant]
    expect(restaurant_details[:name]).to be_a(String)
    expect(restaurant_details[:address]).to be_a(String)

  end

  it 'tests a sad path if no location and or food type is given' do

    get "/api/v1/munchies"
    expect(response).to be_successful
    response_body_1 = JSON.parse(response.body, symbolize_names: true)
    expect(response_body_1[:errors]).to eq("Please include location and food type")

    get "/api/v1/munchies?location=chicago,il"
    expect(response).to be_successful
    response_body_2 = JSON.parse(response.body, symbolize_names: true)
    expect(response_body_2[:errors]).to eq("Please include location and food type")

    get "/api/v1/munchies?food=mexican"
    expect(response).to be_successful
    response_body_3 = JSON.parse(response.body, symbolize_names: true)
    expect(response_body_3[:errors]).to eq("Please include location and food type")

  end

end
