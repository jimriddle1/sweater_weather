# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ForecastService' do

    xit 'returns a forcast given a location' do
      parsed_json = ForecastService.get_forecast("Chicago, IL")

      expect(parsed_json).to be_a Array

      # character = parsed_json.first
      #
      # expect(character).to include :name, :allies, :enemies, :affiliation
      # expect(character[:name]).to be_a(String)
      # expect(character[:affiliation]).to be_a(String)
      # expect(character[:allies]).to be_a(Array)
      # expect(character[:enemies]).to be_a(Array)

    end
end
