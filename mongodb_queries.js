#Query to create a database named STORE
use STORE

#Query to create a new collection
db.createCollection('MOVIE')

#Query to add fields to our document in the collection i have created above
db.movie.insert( {
  movieTitle: 'The Avatar',
  genre: 'Sci-Fi',
  releaseYear: 2009,
  movieLanguage: 'English',
  movieLength: '2:45:01' 
})

////\\\\////\\\\////\\\\////\\\\////\\\\////\\\\/////\\\\////\\\\/////\\\\/////\\\\////\\\\
  #The code below is a script i used to create CRUD functions that manipulate MongoDB
/\\\\////\\\\////\\\\////\\\\////\\\\////\\\\/////\\\\////\\\\/////\\\\/////\\\\\\\\////\\\\

//Requring mongodb package and get the mongo client object
const MongoClient = require('mongodb').MongoClient;

//Creating url to mongodb server since i'm testing it locally
const url = 'mongodb://localhost:27017';

//Creating new Movie object to insert in mongodb
var movie = {
  movieTitle: 'The Dark Knight',
  genre: "Action",
  releaseYear: 2008,
  languge: 'English',
  length: '2:32:49'
};

//Creating genre property to be used as an argument to return functiond
var genre = {
  genre: 'Action'
};

//Creating object to hold the data that will change the release year of a move
var movieYearUpdate = {
  releaseYear: 2010
};

//Creating object to with a property to select a movie to be updated
var movieToBeUpdated = {
  movieTitle: 'Die Hard'
};

//Connect to the mongodb, so it can be queried
MongoClient.connect(url, {useNewUrlParser: true} , (err, client) => {
    if (err) {
      console.error(err);
    }
    //Selecting Database from mongodb server
    const db = client.db('STORE');

    //Getting collection from database store in mongodb server
    const collection = db.collection('MOVIE');
    //console.log(collection);
    
    /*
      After connecting to the database, this is where we call our CRUD functions in this block
      I commented out the other functions, because i didn't what to add, delete and update my
      records all at the same time, while i was testing if they work on my local machine
    */
  
    //Calling function to add movie to mongo DataBase
    #addMovie(movie, collection);
    
    //Calling function to delete a collection from mongo DataBase
    #deleteCollection(collection);

    //Calling function to return a specific movie
    #findAMovie(doc, collection); 

    //Calling function to return all the record in the movie collection
    getAllMovies(collection);

    //Calling function to return movies by genre
    #getMoviesByGenre(collection, genre);

    //Calling function to update movie release year
    #updateMovieReleaseYear(collection, movieYearUpdate, movieToBeUpdated);

    client.close();
  });

//This function inserts a new Movie record into the mongo DataBase
function addMovie(newMovieObject, collection){
  collection.insertOne(newMovieObject)
  .then(result => {
    const insertedId = result;
    console.log(`New movie record with ${insertedId} id has been inserted`);
  });
}

//This function deletes a collection for mongo DataBase, taking the reference to a
//as a parameter
function deleteCollection(collection){
  collection.remove({})
  .then(result =>
    {
      console.log(`${result} Collection deleted successfully`);
    }     
  );
}

//This function looks for a specific record and returns it
//Parameter doc == document to look for in the collection
//collection == the collection in the mongo DataBase
function findAMovie(doc, collection){
  collection.findOne(doc)
  .then(result => {
    console.log(result);
  })
}

//This function returns all the documents in a collection
//Parameter collection = represents the MOVIE collectin in the mongo DataBase
function getAllMovies(collection){
  collection.find().toArray((err, result) => {
    console.log(result);
  });
}

//This function returns movies by genre
function getMoviesByGenre(collection, genre){
  collection.find(genre).toArray((err, result) => {
    console.log(result);
  });
}

//This function updates a movie release year
function updateMovieReleaseYear(collection, movieYearUpdate, movieToBeUpdated){
  collection.updateOne(movieToBeUpdated, {'$set': movieYearUpdate})
  .then(result => {
    console.log(`Successfully updated the of the movie ${result}`);
  });
}
