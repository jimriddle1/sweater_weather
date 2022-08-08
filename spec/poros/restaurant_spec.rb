# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant do

  it 'populates Geocode fields from JSON response' do
    info = {
      :id=>"cKZNbMvoqJaUe7n6lf6i7w",
 :alias=>"wildberry-pancakes-and-cafe-chicago-2",
 :name=>"Wildberry Pancakes and Cafe",
 :image_url=>"https://s3-media2.fl.yelpcdn.com/bphoto/43XNyVUbPJNtC6IFobGRMw/o.jpg",
 :is_closed=>false,
 :url=>
  "https://www.yelp.com/biz/wildberry-pancakes-and-cafe-chicago-2?adjust_creative=D-c_jjXAbApI7wGnEhK3og&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=D-c_jjXAbApI7wGnEhK3og",
 :review_count=>8588,
 :categories=>[{:alias=>"pancakes", :title=>"Pancakes"}, {:alias=>"waffles", :title=>"Waffles"}, {:alias=>"cafes", :title=>"Cafes"}],
 :rating=>4.5,
 :coordinates=>{:latitude=>41.884668, :longitude=>-87.62288},
 :transactions=>["pickup", "delivery"],
 :price=>"$$",
 :location=>
  {:address1=>"130 E Randolph St",
   :address2=>"",
   :address3=>"",
   :city=>"Chicago",
   :zip_code=>"60601",
   :country=>"US",
   :state=>"IL",
   :display_address=>["130 E Randolph St", "Chicago, IL 60601"]},
 :phone=>"+13129389777",
 :display_phone=>"(312) 938-9777",
 :distance=>793.898344949934
}
    restaurant = Restaurant.new(info)

    expect(restaurant).to be_a Restaurant
    expect(restaurant.name).to eq(info[:name])
    expect(restaurant.destination_city).to eq("#{info[:location][:city]}, #{info[:location][:state]}")
    expect(restaurant.address).to eq("#{info[:location][:display_address].join(", ")}")


  end

end
