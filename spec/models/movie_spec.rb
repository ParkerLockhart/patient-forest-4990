require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 79)
    @actor_2 = @movie_1.actors.create!(name: "Cate Blanchett", age: 52)
  end

  describe 'instance methods' do
    describe '#actors_by_age' do
      it 'sorts movie actors by age' do
        expect(@movie_1.actors_by_age).to eq([@actor_2, @actor_1])
      end
    end
  end
end
