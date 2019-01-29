require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name) # character_name is a string
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/').body
  response_hash = JSON.parse(response_string)

 response_hash["results"].each do |character_hash|
  character_hash.each do |key, value|

      if value == character_name

      return character_hash["films"]
    end
end
end
end



def print_movies(films) # films is an array

  # binding.pry
  num = 1
  films.each do |link|

    response_string = RestClient.get(link).body
    response_hash = JSON.parse(response_string)
    puts "#{num}. #{response_hash["title"]}"
    num += 1
  end
end
# iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)

end

# show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
