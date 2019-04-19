class MoviesController < ApplicationController
  def show
    imdb_id = params[:id]
    movie = Movie.find_by(imdb_id: imdb_id)
    if movie
      render json: movie
    else
      base_url = 'http://www.omdbapi.com/'
      api_key = Rails.application.credentials.omdb_api_key
      url = base_url + api_key + "&i=" + imdb_id
      response = HTTParty.get(url)
      if response.parsed_response["Response"] == "True"
        movie = Movie.create_from_omdb(response)
        render json: movie
      else
        render "not found"
      end
    end
  end

  # returns JSON object of imdb_ids and average_ratings
  def average_rating
    ids = params[:ids]
    response_hash = {}
    ids.each do |id|
      movie = Movie.find_by(imdb_id: id)
      if movie && movie.average_rating
        response_hash[id] = movie.average_rating
      end
    end
    render json: response_hash
  end

  def index
    title = params[:title]
    base_url = 'http://www.omdbapi.com/'
    api_key = Rails.application.credentials.omdb_api_key
    url = base_url + api_key + "&s=" + title + "&type=movie"
    response = HTTParty.get(url)
    if response.parsed_response["Response"] == "True"
      movies = response.parsed_response["Search"]
      filtered_movies = movies.select{ |m| m["Poster"] != "N/A" }
      render json: filtered_movies
    end
  end

end
