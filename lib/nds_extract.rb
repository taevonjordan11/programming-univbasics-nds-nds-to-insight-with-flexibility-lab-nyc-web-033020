# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  ret_hash = []
  col = 0 
  while movies_collection[col] do 
    ret_hash[col]= movie_with_director_name(name, movies_collection[col])  
    col += 1
  end
  ret_hash
end


def gross_per_studio(collection)
  ret_hash = {}
  row = 0 
  while collection[row] do
    name = collection[row][:studio]
    total= collection[row][:worldwide_gross]
    if ret_hash[name]  
      ret_hash[name] += total
    else
      ret_hash[name] = total
    end
    row += 1 
  end
  ret_hash
end

def movies_with_directors_set(source)
  index = 0
  a_o_a_movies_by_dir = []

  while index < source.length do
    dir_info_hash = source[index]
    director_name = dir_info_hash[:name]
    directors_movies = dir_info_hash[:movies]
    a_o_a_movies_by_dir << movies_with_director_key(director_name, directors_movies)
    index += 1
  end
  a_o_a_movies_by_dir
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
