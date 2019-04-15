class Movie < ApplicationRecord

  def self.create_from_omdb(response)
    r = response.parsed_response
    m = Movie.create(
      title: r["Title"],
      year: r["Year"],
      rated: r["Rated"],
      director: r["Director"],
      poster: r["Poster"],
      actors: r["Actors"],
      imdb_id: r["imdbID"]
    )
    return m
  end
end
