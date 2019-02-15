#Query to create a database named STORE
use STORE

#Query to create a new collection
db.createCollection('MOVIE')

#Query to add fields to our document in the collection i've created above
db.movie.insert( {   
  movieTitle: 'The Avatar',   
  genre: 'Sci-Fi',   
  releaseYear: 2009,   
  movieLanguage: 'English',   
  movieLength: '2:45:00' 
})

