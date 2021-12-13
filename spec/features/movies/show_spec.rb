require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 79)
    @actor_2 = @movie_1.actors.create!(name: "Cate Blanchett", age: 52)
    @actor_3 = Actor.create!(name: "Actor Person", age: 33)
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

  it 'shows average age of all actors' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.actors_average_age)
  end

  it 'can add existing actor to movie' do
    visit "/movies/#{@movie_1.id}"

    fill_in('name', with: @actor_3.name)
    click_button("Submit")

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content('Actor Person')
    expect(@movie_1.actors_average_age).to eq(54)
  end

end
