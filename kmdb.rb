# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.

# Generated using rails generate model and rails db:migrate commands

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Inserting new rows into Studio model
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save # actually add to table

# Inserting new rows into Movie model
new_movie_1 = Movie.new
new_movie_1["title"] = "Batman Begins"
new_movie_1["year_released"] = 2005
new_movie_1["rated"] = "PG-13"
new_movie_1["studio_id"] = Studio.find_by({"name" => "Warner Bros."})["id"]
new_movie_1.save

new_movie_2 = Movie.new
new_movie_2["title"] = "The Dark Knight"
new_movie_2["year_released"] = 2008
new_movie_2["rated"] = "PG-13"
new_movie_2["studio_id"] = Studio.find_by({"name" => "Warner Bros."})["id"]
new_movie_2.save

new_movie_3 = Movie.new
new_movie_3["title"] = "The Dark Knight Rises"
new_movie_3["year_released"] = 2012
new_movie_3["rated"] = "PG-13"
new_movie_3["studio_id"] = Studio.find_by({"name" => "Warner Bros."})["id"]
new_movie_3.save

# Inserting new rows into Actor model
new_actor_1 = Actor.new
new_actor_1["name"] = "Christian Bale"
new_actor_1.save

new_actor_2 = Actor.new
new_actor_2["name"] = "Michael Caine"
new_actor_2.save

new_actor_3 = Actor.new
new_actor_3["name"] = "Liam Neeson"
new_actor_3.save

new_actor_4 = Actor.new
new_actor_4["name"] = "Katie Holmes"
new_actor_4.save

new_actor_5 = Actor.new
new_actor_5["name"] = "Gary Oldman"
new_actor_5.save

new_actor_6 = Actor.new
new_actor_6["name"] = "Heath Ledger"
new_actor_6.save

new_actor_7 = Actor.new
new_actor_7["name"] = "Aaron Eckhart"
new_actor_7.save

new_actor_8 = Actor.new
new_actor_8["name"] = "Maggie Gyllenhaal"
new_actor_8.save

new_actor_9 = Actor.new
new_actor_9["name"] = "Tom Hardy"
new_actor_9.save

new_actor_10 = Actor.new
new_actor_10["name"] = "Joseph Gordon-Levitt"
new_actor_10.save

new_actor_11 = Actor.new
new_actor_11["name"] = "Anne Hathaway"
new_actor_11.save

# Inserting new rows into Role model
bb_role_1 = Role.new
bb_role_1["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
bb_role_1["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
bb_role_1["character_name"] = "Bruce Wayne"
bb_role_1.save

bb_role_2 = Role.new
bb_role_2["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
bb_role_2["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
bb_role_2["character_name"] = "Alfred"
bb_role_2.save

bb_role_3 = Role.new
bb_role_3["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
bb_role_3["actor_id"] = Actor.find_by({"name" => "Liam Neeson"})["id"]
bb_role_3["character_name"] = "Ra's Al Ghul"
bb_role_3.save

bb_role_4 = Role.new
bb_role_4["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
bb_role_4["actor_id"] = Actor.find_by({"name" => "Katie Holmes"})["id"]
bb_role_4["character_name"] = "Rachel Dawes"
bb_role_4.save

bb_role_5 = Role.new
bb_role_5["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
bb_role_5["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
bb_role_5["character_name"] = "Commissioner Gordon"
bb_role_5.save

tdk_role_1 = Role.new
tdk_role_1["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
tdk_role_1["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
tdk_role_1["character_name"] = "Bruce Wayne"
tdk_role_1.save

tdk_role_2 = Role.new
tdk_role_2["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
tdk_role_2["actor_id"] = Actor.find_by({"name" => "Heath Ledger"})["id"]
tdk_role_2["character_name"] = "Joker"
tdk_role_2.save

tdk_role_3 = Role.new
tdk_role_3["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
tdk_role_3["actor_id"] = Actor.find_by({"name" => "Aaron Eckhart"})["id"]
tdk_role_3["character_name"] = "Harvey Dent"
tdk_role_3.save

tdk_role_4 = Role.new
tdk_role_4["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
tdk_role_4["actor_id"] = Actor.find_by({"name" => "Maggie Gyllenhaal"})["id"]
tdk_role_4["character_name"] = "Rachel Dawes"
tdk_role_4.save

tdk_role_5 = Role.new
tdk_role_5["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
tdk_role_5["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
tdk_role_5["character_name"] = "Commissioner Gordon"
tdk_role_5.save

tdkr_role_1 = Role.new
tdkr_role_1["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
tdkr_role_1["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
tdkr_role_1["character_name"] = "Bruce Wayne"
tdkr_role_1.save

tdkr_role_2 = Role.new
tdkr_role_2["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
tdkr_role_2["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
tdkr_role_2["character_name"] = "Commissioner Gordon"
tdkr_role_2.save

tdkr_role_3 = Role.new
tdkr_role_3["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
tdkr_role_3["actor_id"] = Actor.find_by({"name" => "Tom Hardy"})["id"]
tdkr_role_3["character_name"] = "Bane"
tdkr_role_3.save

tdkr_role_4 = Role.new
tdkr_role_4["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
tdkr_role_4["actor_id"] = Actor.find_by({"name" => "Joseph Gordon-Levitt"})["id"]
tdkr_role_4["character_name"] = "John Blake"
tdkr_role_4.save

tdkr_role_5 = Role.new
tdkr_role_5["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
tdkr_role_5["actor_id"] = Actor.find_by({"name" => "Anne Hathaway"})["id"]
tdkr_role_5["character_name"] = "Selina Kyle"
tdkr_role_5.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

# find studio of interest then grab all the movies where studio id = wb id
wb = Studio.find_by({"name" => "Warner Bros."})
wb_movies = Movie.where({"studio_id" => wb["id"]})

# do the actual loop
for movie in wb_movies
    puts "#{movie["title"]}        #{movie["year_released"]}         #{movie["rated"]}        #{wb["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# Loop through role table, attach values through movie id and actor id

#  Nested loop: for each movie, get a list of roles for each movie; then for each role, get the actor for that role
for movie in wb_movies
    
    movie_roles = Role.where({"movie_id" => movie["id"]})
    
    for role in movie_roles
        #attach actor... actor_id from Role = id from Actor
        movie_actor = Actor.find_by({"id" => role["actor_id"]})
        puts "#{movie["title"]} #{movie_actor["name"]} #{role["character_name"]}"
    end

end

