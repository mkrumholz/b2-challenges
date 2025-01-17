require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @jim = Mechanic.create!(name: "Jim", years_experience: 17)
    @hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)
    @tea_cups = @jim.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true, amusement_park: @hershey)
    @tot = @jim.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true, amusement_park: @hershey)
    @swings = @jim.rides.create!(name: 'The Swings', thrill_rating: 5, open: true, amusement_park: @hershey)
    @strawberry = @jim.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false, amusement_park: @hershey)
  end

  it 'displays the mechanics name and years experience' do
    visit "/mechanics/#{@jim.id}"

    expect(page).to have_content 'Jim'
    expect(page).to have_content 'Experience: 17 years'
  end

  it 'shows names of all rides the mechanic is working on, ordered by thrill_rating' do
    visit "/mechanics/#{@jim.id}"

    expect(@tot.name).to appear_before(@swings.name)
    expect(@swings.name).to appear_before(@tea_cups.name)
  end

  it 'does not show rides that are not open' do
    visit "/mechanics/#{@jim.id}"

    expect(page).to_not have_content 'Strawberry Fields'
  end

  it 'can add a ride to mechanic workload' do
    new_ride = Ride.create!(name: 'Scrambler', thrill_rating: 4, open: true, amusement_park: @hershey)

    visit "/mechanics/#{@jim.id}"

    expect(page).to have_content 'Add a ride to workload:'
    fill_in 'Ride Id', with: "#{new_ride.id}"
    click_on 'Submit'

    expect(page).to have_content 'Scrambler'
  end
end
