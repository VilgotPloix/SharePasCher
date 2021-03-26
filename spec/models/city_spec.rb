require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do 
    @city = City.create(city_name: "Paris")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

  end

  context "associations" do

    describe "city" do
      it "should have_many events" do
        host = User.create(first_name: "Michel", last_name: "Host", email: "michel.host@test.com", password: "ceciestuntest", birth_day: "05/06/1992", gender: "H", is_host: true)
        event = Event.create(title: "Petit repas", description: "Un bon petit repas entre amis", guests_number: 5, city: @city, host_id: host.id)
        expect(@city.events.include?(event)).to eq(true)
      end
    end

  end
end
