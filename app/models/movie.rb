class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_by_age
    actors.order(:age)
  end

  def actors_average_age
    actors.average(:age).to_i
  end
end
