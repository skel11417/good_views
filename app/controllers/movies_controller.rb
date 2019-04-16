class MoviesController < ApplicationController
  def show
    imdb_id = params[:id]
    movie = Movie.find_by(imdb_id: imdb_id)
    if movie
      render json: movie
    else
      base_url = 'http://www.omdbapi.com/'
      api_key = Rails.application.credentials.omdb_api_key
      url = base_url + "?apikey=" + api_key + "&i=" + imdb_id
      response = HTTParty.get(url)
      if response.parsed_response["Response"] == "True"
        movie = Movie.create_from_omdb(response)
        render json: movie
      else
        render "not found"
      end
    end
  end

  def index
    title = params[:title]
    base_url = 'http://www.omdbapi.com/'
    api_key = Rails.application.credentials.omdb_api_key
    url = base_url + "?apikey=" + api_key + "&s=" + title + "&type=movie"
    response = HTTParty.get(url)
    if response.parsed_response["Response"] == "True"
      # turn this into something we can use
      render json: response
    end
  end

end
