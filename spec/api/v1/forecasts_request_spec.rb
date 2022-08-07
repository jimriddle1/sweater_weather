require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns the current forecast' do


    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]
    # binding.pry
    # expect(items.count).to eq(3)
    # #
    # items.each do |item|
    #   expect(item).to have_key(:id)
    #   expect(item[:id]).to be_an(String)
    #
    #   expect(item).to have_key(:attributes)
    #   expect(item[:attributes][:name]).to be_a(String)
    #
    #   expect(item).to have_key(:attributes)
    #   expect(item[:attributes][:description]).to be_a(String)
    #
    #   expect(item).to have_key(:attributes)
    #   expect(item[:attributes][:unit_price]).to be_a(Float)
    # end
  end

end
