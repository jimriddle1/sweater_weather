require 'rails_helper'

RSpec.describe 'Restaurant API' do
  it 'returns the the restaurant info based on locaiton and food type' do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get "/api/v1/munchies?location=chicago,il,&food=mexican"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    restaurant = response_body[:data]

    expect(forecast[:id]).to eq("null")
    expect(forecast[:type]).to eq("forecast")

    current_weather = forecast[:attributes][:current_weather]

    expect(current_weather).to be_a Hash

    expect(current_weather).to include :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon
    expect(current_weather[:datetime]).to be_a(String)
    expect(current_weather[:sunrise]).to be_a(String)
    expect(current_weather[:sunset]).to be_a(String)
    expect(current_weather[:temperature]).to be_a(Numeric)
    expect(current_weather[:feels_like]).to be_a(Numeric)
    expect(current_weather[:humidity]).to be_a(Integer)
    expect(current_weather[:uvi]).to be_a(Float)
    expect(current_weather[:visibility]).to be_a(Integer)
    expect(current_weather[:conditions]).to be_a(String)
    expect(current_weather[:icon]).to be_a(String)



  end

end
