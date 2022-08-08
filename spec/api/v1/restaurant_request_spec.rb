require 'rails_helper'

RSpec.describe 'Restaurant API' do
  it 'returns the the restaurant info based on locaiton and food type' do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
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
    expect(restaurant_forecast[:temperature]).to be_a(Float)

    restaurant_details = restaurant_info[:restaurant]
    expect(restaurant_details[:name]).to be_a(String)
    expect(restaurant_details[:address]).to be_a(String)




  end

end
