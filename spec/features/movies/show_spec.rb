require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 79)
    @actor_2 = @movie_1.actors.create!(name: "Cate Blanchett", age: 52)
  end

  it 'shows movies titles' do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content(@movie_1.title)
    expect(page).to_not have_content(@movie_2.title)
  end

  it 'shows movies creation_year' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.creation_year)
  end

  it 'shows movies genre' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.genre)
  end

  it 'shows movies actors' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
  end

  it 'shows movies actors ordered by age asc' do
    visit "/movies/#{@movie_1.id}"

    expect(@actor_2.name).to appear_before(@actor_1.name)
  end

  xit 'shows average age of all actors' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.actors.average_age)
  end

end
