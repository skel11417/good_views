class MoviesController < ApplicationController
  def show
    title = params[:title]
    movie = Movie.find_by(title: title.titleize)
    if movie
      render json: movie
    else
      base_url = 'http://www.omdbapi.com/'
      api_key = Rails.application.credentials.omdb_api_key
      url = base_url + "?apikey=" + api_key + "&t=" + title
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
