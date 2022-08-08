require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns the current forecast', :vcr do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get "/api/v1/forecast?location=chicago,il, headers:header"
    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]

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

    daily_weather = forecast[:attributes][:daily_weather]
    expect(daily_weather).to be_an Array

    first_day = daily_weather.first
    expect(first_day).to include :datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon
    expect(first_day[:datetime]).to be_a(String)
    expect(first_day[:sunrise]).to be_a(String)
    expect(first_day[:sunset]).to be_a(String)
    expect(first_day[:max_temp]).to be_a(Numeric)
    expect(first_day[:min_temp]).to be_a(Numeric)
    expect(first_day[:conditions]).to be_a(String)
    expect(first_day[:icon]).to be_a(String)

    hourly_weather = forecast[:attributes][:hourly_weather]
    expect(hourly_weather).to be_an Array

    first_hour = hourly_weather.first
    expect(first_hour).to include :time, :temperature, :conditions, :icon
    expect(first_hour[:time]).to be_a(String)
    expect(first_hour[:temperature]).to be_a(Numeric)
    expect(first_hour[:conditions]).to be_a(String)
    expect(first_hour[:icon]).to be_a(String)

  end

end
