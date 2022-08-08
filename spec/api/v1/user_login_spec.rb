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

  it 'returns an api key when a user is created', :vcr do
    login_body = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post "/api/v1/sessions", headers:@header, params: JSON.generate(body)

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]

    expect(data[:id]).to be_a String
    expect(data[:type]).to eq("users")

    user_attributes = data[:attributes]

    expect(user_attributes).to be_a Hash
    expect(user_attributes[:email]).to be_a String
    expect(user_attributes[:api_key]).to be_a String

  end

  xit 'returns an api key when a user is created: sad path passwords do not match', :vcr do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "other_password"
      }
    post "/api/v1/users", headers:header, params: JSON.generate(body)

    expect(response).to_not be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]
    expect(data[:errors]).to eq("doesn't match Password")

  end

  xit 'returns an api key when a user is created: sad path user already exists', :vcr do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
    post "/api/v1/users", headers:header, params: JSON.generate(body)

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
    post "/api/v1/users", headers:header, params: JSON.generate(body)

    expect(response).to_not be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    data = response_body[:data]
    expect(data[:errors]).to eq("has already been taken")

  end

end
