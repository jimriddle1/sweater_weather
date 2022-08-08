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

  it 'returns an api key when a user is logged in', :vcr do
    login_body = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post "/api/v1/sessions", headers:@header, params: JSON.generate(login_body)

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]
    # binding.pry

    expect(data[:id]).to be_a String
    expect(data[:type]).to eq("users")

    user_attributes = data[:attributes]

    expect(user_attributes).to be_a Hash
    expect(user_attributes[:email]).to be_a String
    expect(user_attributes[:api_key]).to be_a String

  end

  it 'returns an api key when a user is logged in: sad path incorrect password', :vcr do

    login_body = {
      "email": "whatever@example.com",
      "password": "password_2"
    }

    post "/api/v1/sessions", headers:@header, params: JSON.generate(login_body)

    expect(response).to_not be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]
    expect(data[:errors]).to eq("Invalid Credentials")

  end


end
