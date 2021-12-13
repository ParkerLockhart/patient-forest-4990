universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
movie_2 = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

actor_1 = movie_1.actors.create!(name: "Harrison Ford", age: 79)
actor_2 = movie_1.actors.create!(name: "Cate Blanchett", age: 52)
