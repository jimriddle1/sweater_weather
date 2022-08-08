require 'rails_helper'

RSpec.describe 'User API' do
  it 'returns an api key when a user is created', :vcr do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
    post "/api/v1/users", headers:header, params: JSON.generate(body)

    expect(response).to be_successful

    # expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

  end

end
