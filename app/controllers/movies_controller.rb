class MoviesController < ApplicationController
  def index
    title = params[:title]
    movie = Movie.find_by(title: title.titleize)
    if movie
      render json: movie
    else
      base_url = 'http://www.omdbapi.com/'
      api_key = "replace this"
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

end
