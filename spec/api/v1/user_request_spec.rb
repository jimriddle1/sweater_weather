require 'rails_helper'

RSpec.describe 'User API' do
  xit 'returns an api key when a user is created' do

    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    user_body = {  }

    post "/api/v1/users, headers:header"
    # expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    binding.pry

  end

end
