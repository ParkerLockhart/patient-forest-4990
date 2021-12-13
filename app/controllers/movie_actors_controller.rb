class MovieActorsController < ApplicationController

  def create
    @movie = Movie.find(params[:id])
    @actor = Actor.find_by name: (params[:name])
    MovieActor.create!(actor: @actor, movie: @movie)
    redirect_to "/movies/#{@movie.id}"
  end
end
