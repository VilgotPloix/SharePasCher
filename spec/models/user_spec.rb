require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create(first_name: "Michel", last_name: "Bar", email: "michel.bar@test.com", password: "ceciestuntest", birth_day: "05/06/1992", gender: "H", is_host: false)
    @host = User.create(first_name: "Michel", last_name: "Host", email: "michel.host@test.com", password: "ceciestuntest", birth_day: "05/06/1992", gender: "H", is_host: true)
    @city = City.create(city_name: "Paris")
    @event = Event.create(title: "Petit repas", description: "Un bon petit repas entre amis", guests_number: 5, city: @city, host_id: @host.id)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid if not string" do
        bad_user = User.create(first_name: 56)
        expect(bad_user).not_to be_valid
      end
    end

    describe "#last_name" do
      it "should not be valid if not string" do
        bad_user = User.create(last_name: 42)
        expect(bad_user).not_to be_valid
      end
    end

    describe "#gender" do
      it "should not be valid if it is not a string" do
        invalid_user = User.create(first_name: "Michel", last_name: "Bar", email: "michel.bar@test.com", password: "ceciestuntest", birth_day: "05/06/1992", gender: 53)
        expect(invalid_user).not_to be_valid
      end
    end

  end

  context "associations" do

    describe "events" do
      it "should have_many events through appointments" do
        appointment = Appointment.create(user: @user, event: @event)
        expect(@user.appointments.include?(appointment)).to eq(true)
        expect(@user.events.include?(@event)).to eq(true)
      end
    end

    describe "host" do
      it "should be a user that hosts an event " do
        hosted_event = Event.create(title: "Petit repas", description: "Un bon petit repas entre amis", guests_number: 5, city: @city, host_id: @host.id)
        expect(@host.created_events.include?(hosted_event)).to eq(true)
      end
    end

  end



  context "public instance methods" do

    describe "#is_profile_fully_completed" do

      it "it should return the correct boolean" do
        user_1 = @user
        expect(user_1.is_profile_fully_completed).to eq(true)
        user_2 = User.create(first_name: "Michel", last_name: "Bar", email: "michel.bar@test.com", password: "ceciestuntest", gender: "H", is_host: false)
        expect(user_2.is_profile_fully_completed).to eq(false)
      end
    end

  end

end
