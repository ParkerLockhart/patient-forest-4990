require 'rails_helper'

RSpec.describe 'studios index page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    visit '/studios'
  end

  it 'shows each studio name' do
    expect(page).to have_content(@universal.name)
  end

  it 'shows each studio location' do
    expect(page).to have_content(@universal.location)
  end

  it 'shows each studio movies' do
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
  end 
end
